using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[Serializable]
public enum ContinuityType
{
    Continuous,
    NonContinuous
}

[Serializable]
public class Continuity 
{
    [SerializeField]
    public ContinuityType type;
    [SerializeField]
    public float Duration;
}
