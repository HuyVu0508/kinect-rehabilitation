# Real-time Physical Therapy Assisting System using Kinect

## Introduction

Physical therapy is intensely used in medical treatments to help patients regain their movements abilities after injury or operations. It can be considered a safe treatment because it doesn't require injection or having drugs into the body which might potentially cause side effects. In order to practice, patients usually need the supervision from professional therapists who will monitor and give feedback for improvements. This, however, poses a problem, that is patients need the therapists' presence whenever they want to practice, and therefore causing a time and monetary problem. This strictly limits the practices of patients. The figure below illustrates some arms rehabilitation practices used in this work.

<p align="center">
  <img width="500" src="../master/illustrations/sample_practices.jpg">
</p>
<p align="center">
    <em>Four samples practices used in this study.</em>
</p>


Therefore, if we can build a home system that can replace the role of the therapist in helping with the rehabilitation process, that would greatly help patients. It will reduce the cost of traveling for both patients and therapists, patients can also practice any time anywhere without the need to match the therapists' busy schedule.

In this work, we propose building a system using Microsoft Kinect to play the role of the therapist in monitoring patients' practices. The system will first record the sample practices from a professional therapist, then use them as gold-standard to compare against patients' practices to check whether the patients have executed the move correctly or not. At the same time, giving instructions and feedback in real-time using AR technology.

## Methodology
We can divide the problem of such system into smaller problems, corresponding to the system pipeline and function modules:- Module for recording and saving sample practices (by professional therapist)- Module for recording actually practices (by patients)- Module for comparing patients' practices to therapists' practices and give feedback- module for helpful features, such as instructing patients and real-time feedback using AR

#### Recording sample practices
The first step is designing a pipeline for efficiently recording the sample practices by therapists as gold standards. The 3D space locations of the joints are recorded and processed and saved in the memory. The figure below illustrates a recorded signal of a practice move (arm XY plane). The signals are calibrated to be invariant to different body's types. The sample practice therefore can be recorded once and can be used for many patients' cases.

<p align="center">
  <img width="700" src="../master/illustrations/movement_signal.png">
</p>
<p align="center">
    <em>Signal recorded and processed for one practicing movement.</em>
</p>

#### Recording patients' practices
The second step is designing a pipeline for recording patients' practices that are able to assess the practice on-the-fly and give feedback (without waiting until the end of the move). The system can detect whether the movements are too fast/low or the movement range is not correct. We science this by using the Dynamic Time Warping algorithm to compare the patients' and therapists' movements signals.

The figure below illustrates the Dynamic Time Warping algorithm used to process Kinect signals from patients and therapists.

<p align="center">
  <img width="500"  src="../master/illustrations/DTW.jpg">
</p>
<p align="center">
    <em>Dynamic warping algorithm used to match practices signals from patients to therapists'.</em>
</p>

The figure below illustrates the module's pipeline for recording patients' practice and evaluating it on-the-fly. Feedbacks are given for the patients to improve their performances.

<p align="center">
  <img width="700" src="../master/illustrations/record_evaluate_pipipeline.jpg">
</p>
<p align="center">
    <em>Pipeline for recording patients' practices, creating a framework for providing real-time instructions and feedbacks.</em>
</p>

#### Comparisons and Rating practices quality
Besides evaluating the patients' performance in real-time, we also want to evaluate them at the end of the move by calculating the accumulated errors and infer the practicing scores. This evaluation will determine whether the movement executed is good enough or not and needs to be executed again. The figure below illustrates how a movement is evaluated based on its accumulated errors.

<p align="center">
  <img width="400" src="../master/illustrations/error_evaluation.png">
</p>
<p align="center">
    <em>Patients' practices evaluating criteria.</em>
</p>

The table below illustrates how well the system evaluates correctly a movement using the described rules.

<p align="center">
  <img width="500" src="../master/illustrations/evaluation_model.png">
</p>
<p align="center">
    <em>Evaluating system's performance on classifying practices correctness.</em>
</p>

#### Leading and real-time feedback using Augmented Reality
To help the patients' with their practices. We develop an AR system to help lead and instruct their limbs movements by showing in real-time the current and next positions their limbs should be. To determine the next limbs position, we utilize the local Dynamic Time Warping approach, where we can detect which stage the users are in and therefore suggest the next limbs position. The users feedback indicates that this feature does improve the experience. The patients don't need to remember what the next movement is (the AR features show it on the screen), so they can focus on executing the moves correctly. The figure below illustrating the AR features in actions.

<p align="center">
  <img width="300" src="../master/illustrations/ar.png">
</p>
<p align="center">
    <em>Augmented reality features for real-time instructions and feedbacks.</em>
</p>

<p align="center">
  <img width="500" src="../master/illustrations/local_DTW.jpg">
</p>
<p align="center">
    <em>Local dynamic warping algorithm.</em>
</p>

#### User interface
We develop the user interface with the objective for simplicity and informative in mind. Below is our main interface for the system with explanations for each section's functions.

<p align="center">
  <img width="500" src="../master/illustrations/interface.png">
</p>
<p align="center">
    <em>User interface.</em>
</p>

For more detailed information, please look at the thesis.pdf file included in this repository.
