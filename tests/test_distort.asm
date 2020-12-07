%include "sointu/header.inc"

BEGIN_SONG BPM(100),OUTPUT_16BIT(0),CLIP_OUTPUT(0),DELAY_MODULATION(0),HOLD(1)

BEGIN_PATTERNS
    PATTERN 64,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0
END_PATTERNS

BEGIN_TRACKS
    TRACK VOICES(1),0
END_TRACKS

BEGIN_PATCH
    BEGIN_INSTRUMENT VOICES(1)
        SU_ENVELOPE STEREO(0),ATTACK(64),DECAY(64),SUSTAIN(64),RELEASE(80),GAIN(128)
        SU_DISTORT  STEREO(0),DRIVE(32)
        SU_ENVELOPE STEREO(0),ATTACK(64),DECAY(64),SUSTAIN(64),RELEASE(80),GAIN(128)
        SU_DISTORT  STEREO(0),DRIVE(96)
        SU_OUT      STEREO(1),GAIN(128)
    END_INSTRUMENT
END_PATCH

END_SONG
