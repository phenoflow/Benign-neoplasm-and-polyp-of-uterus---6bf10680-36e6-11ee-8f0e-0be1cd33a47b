cwlVersion: v1.0
steps:
  read-potential-cases-i2b2:
    run: read-potential-cases-i2b2.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  endoscopic-benign-neoplasm-and-polyp-of-uterus---primary:
    run: endoscopic-benign-neoplasm-and-polyp-of-uterus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-i2b2/output
  other-benign-neoplasm-and-polyp-of-uterus---primary:
    run: other-benign-neoplasm-and-polyp-of-uterus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: endoscopic-benign-neoplasm-and-polyp-of-uterus---primary/output
  benign-neoplasm-and-polyp-of-uterus-uteri---primary:
    run: benign-neoplasm-and-polyp-of-uterus-uteri---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: other-benign-neoplasm-and-polyp-of-uterus---primary/output
  endometrial-benign-neoplasm-and-polyp-of-uterus---primary:
    run: endometrial-benign-neoplasm-and-polyp-of-uterus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: benign-neoplasm-and-polyp-of-uterus-uteri---primary/output
  benign-neoplasm-and-polyp-of-uterus---primary:
    run: benign-neoplasm-and-polyp-of-uterus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: endometrial-benign-neoplasm-and-polyp-of-uterus---primary/output
  benign-neoplasm-and-polyp-of-uterus-uteri---secondary:
    run: benign-neoplasm-and-polyp-of-uterus-uteri---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: benign-neoplasm-and-polyp-of-uterus---primary/output
  other-benign-neoplasm-and-polyp-of-uterus---secondary:
    run: other-benign-neoplasm-and-polyp-of-uterus---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: benign-neoplasm-and-polyp-of-uterus-uteri---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: other-benign-neoplasm-and-polyp-of-uterus---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
