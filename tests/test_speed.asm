%define BPM 100

%include "sointu/header.inc"

BEGIN_PATTERNS
    PATTERN 64,0,64,64,64,0,64,64,64,0,64,64,65,0,65,65
    PATTERN 64,0, 0, 0, 0,0, 0, 0, 0,0, 0, 0, 0,0, 0, 0
    PATTERN 78,0,54, 0,78,0,54, 0,78,0,54, 0,78,0,54, 0
END_PATTERNS

BEGIN_TRACKS
    TRACK VOICES(1),0,0
    TRACK VOICES(1),1,2
END_TRACKS

BEGIN_PATCH
    BEGIN_INSTRUMENT VOICES(1)
        SU_ENVELOPE   MONO,ATTACK(64),DECAY(64),SUSTAIN(0),RELEASE(64),GAIN(128)
        SU_ENVELOPE   MONO,ATTACK(64),DECAY(64),SUSTAIN(0),RELEASE(64),GAIN(128)
        SU_OSCILLATOR MONO,TRANSPOSE(64),DETUNE(32),PHASE(0),COLOR(96),SHAPE(64),GAIN(128),TYPE(TRISAW),LFO(0),UNISON(0)
        SU_OSCILLATOR MONO,TRANSPOSE(72),DETUNE(64),PHASE(64),COLOR(64),SHAPE(96),GAIN(128),TYPE(TRISAW),LFO(0),UNISON(0)
        SU_MULP       STEREO
        SU_OUT        STEREO,GAIN(128)
    END_INSTRUMENT
    BEGIN_INSTRUMENT VOICES(1)
        SU_LOADNOTE MONO
        SU_SPEED    MONO
    END_INSTRUMENT
END_PATCH

%include "sointu/footer.inc"
