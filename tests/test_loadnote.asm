%include "sointu/header.inc"

BEGIN_SONG BPM(100),OUTPUT_16BIT(0),CLIP_OUTPUT(0),DELAY_MODULATION(0)

BEGIN_PATTERNS
    PATTERN 64,0,68,0,32,0,0,0,75,0,78,0,0,0,0,0
END_PATTERNS

BEGIN_TRACKS
    TRACK VOICES(1),0
END_TRACKS

BEGIN_PATCH
    BEGIN_INSTRUMENT VOICES(1)
        SU_LOADNOTE STEREO(0)
        SU_LOADNOTE STEREO(0)
        SU_OUT      STEREO(1),GAIN(128)
    END_INSTRUMENT
END_PATCH

END_SONG
