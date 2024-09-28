package tracker

import (
	"errors"
	"fmt"
	"math"

	"github.com/vsariola/sointu"
)

type (
	Volume [2]float64

	// VolumeAnalyzer measures the volume in an AudioBuffer, in decibels relative to
	// full scale (0 dB = signal level of +-1)
	VolumeAnalyzer struct {
		Level   Volume  // current volume level of left and right channels
		Attack  float64 // attack time constant in seconds
		Release float64 // release time constant in seconds
		Min     float64 // minimum volume in decibels
		Max     float64 // maximum volume in decibels
	}
)

func nanError(counter int, sample int, channel int, bufferLength int) error {
	var msg string = ""
	if counter == 0 {
		return nil
	} else if counter == 1 {
		msg = fmt.Sprintf("NaN detected in master output: sample %d, channel %d", sample, channel)
	} else {
		msg = fmt.Sprintf("%d NaNs detected in master output, first at sample %d, channel %d (buffer length %d)", counter, sample, channel, bufferLength)
	}
	return errors.New(msg)
}

// Update updates the Level field, by analyzing the given buffer.
//
// Internally, it first converts the signal to decibels (0 dB = +-1). Then, the
// average volume level is computed by smoothing the decibel values with a
// exponentially decaying average, with a time constant Attack (in seconds) if
// the decibel value is greater than current level and time constant Decay (in
// seconds) if the decibel value is less than current level.
//
// Typical time constants for average level detection would be 0.3 seconds for
// both attack and release. For peak level detection, attack could be 1.5e-3 and
// release 1.5 (seconds)
//
// MinVolume and MaxVolume are hard limits in decibels to prevent negative
// infinities for volumes
func (v *VolumeAnalyzer) Update(buffer sointu.AudioBuffer) (err error) {
	// from https://en.wikipedia.org/wiki/Exponential_smoothing
	alphaAttack := 1 - math.Exp(-1.0/(v.Attack*44100))
	alphaRelease := 1 - math.Exp(-1.0/(v.Release*44100))
	// qm: error info for debugging
	var nanCounter = 0
	var firstNaNsampleIndex = 0
	var firstNaNsampleChannel = 0
	for j := 0; j < 2; j++ {
		for i := 0; i < len(buffer); i++ {
			sample2 := float64(buffer[i][j] * buffer[i][j])
			if math.IsNaN(sample2) {
				if nanCounter == 0 {
					firstNaNsampleIndex = i
					firstNaNsampleChannel = j
				}
				nanCounter++
				continue
			}
			dB := 10 * math.Log10(sample2)
			if dB < v.Min || math.IsNaN(dB) {
				dB = v.Min
			}
			if dB > v.Max {
				dB = v.Max
			}
			a := alphaAttack
			if dB < v.Level[j] {
				a = alphaRelease
			}
			v.Level[j] += (dB - v.Level[j]) * a
		}
	}
	if nanCounter == 0 {
		return nil
	} else {
		err = nanError(
			nanCounter,
			firstNaNsampleIndex,
			firstNaNsampleChannel,
			len(buffer))
		fmt.Println(err)
		return err
	}
}
