%include "sointu/header.inc"

BEGIN_SONG BPM(100),OUTPUT_16BIT(0),CLIP_OUTPUT(0),DELAY_MODULATION(0)

BEGIN_PATTERNS
    PATTERN 64,HLD,HLD,HLD,HLD,HLD,HLD,HLD,0,0,0,0,0,0,0,0
END_PATTERNS

BEGIN_TRACKS
    TRACK VOICES(1),0
END_TRACKS

BEGIN_PATCH
    BEGIN_INSTRUMENT VOICES(1)
        SU_LOADVAL STEREO(0),VALUE(32)
        SU_GAIN    STEREO(0),GAIN(128)
        SU_LOADVAL STEREO(0),VALUE(128)
        SU_GAIN    STEREO(0),GAIN(64)
        SU_OUT     STEREO(1),GAIN(128)
    END_INSTRUMENT
END_PATCH

END_SONG
