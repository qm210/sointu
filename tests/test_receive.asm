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
        SU_LOADVAL STEREO(0),VALUE(32)
        SU_SEND    STEREO(0),AMOUNT(128),VOICE(0),UNIT(5),PORT(0),SENDPOP(0)
        SU_SEND    STEREO(0),AMOUNT(128),VOICE(0),UNIT(6),PORT(0),SENDPOP(1)
        SU_LOADVAL STEREO(0),VALUE(128)
        SU_SEND    STEREO(0),AMOUNT(128),VOICE(0),UNIT(6),PORT(0),SENDPOP(1)
        SU_RECEIVE STEREO(0)
        SU_RECEIVE STEREO(0)
        SU_OUT     STEREO(1),GAIN(128)
    END_INSTRUMENT
END_PATCH

END_SONG
