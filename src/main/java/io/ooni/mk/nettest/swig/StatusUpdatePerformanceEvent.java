/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 3.0.12
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package io.ooni.mk.nettest.swig;

public class StatusUpdatePerformanceEvent {
  private transient long swigCPtr;
  protected transient boolean swigCMemOwn;

  protected StatusUpdatePerformanceEvent(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(StatusUpdatePerformanceEvent obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        mk_swig_nettestJNI.delete_StatusUpdatePerformanceEvent(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  public void setDirection(String value) {
    mk_swig_nettestJNI.StatusUpdatePerformanceEvent_direction_set(swigCPtr, this, value);
  }

  public String getDirection() {
    return mk_swig_nettestJNI.StatusUpdatePerformanceEvent_direction_get(swigCPtr, this);
  }

  public void setElapsed(double value) {
    mk_swig_nettestJNI.StatusUpdatePerformanceEvent_elapsed_set(swigCPtr, this, value);
  }

  public double getElapsed() {
    return mk_swig_nettestJNI.StatusUpdatePerformanceEvent_elapsed_get(swigCPtr, this);
  }

  public void setNumStreams(long value) {
    mk_swig_nettestJNI.StatusUpdatePerformanceEvent_numStreams_set(swigCPtr, this, value);
  }

  public long getNumStreams() {
    return mk_swig_nettestJNI.StatusUpdatePerformanceEvent_numStreams_get(swigCPtr, this);
  }

  public void setSpeedKbps(double value) {
    mk_swig_nettestJNI.StatusUpdatePerformanceEvent_speedKbps_set(swigCPtr, this, value);
  }

  public double getSpeedKbps() {
    return mk_swig_nettestJNI.StatusUpdatePerformanceEvent_speedKbps_get(swigCPtr, this);
  }

  public StatusUpdatePerformanceEvent() {
    this(mk_swig_nettestJNI.new_StatusUpdatePerformanceEvent(), true);
  }

  public final static String key = mk_swig_nettestJNI.StatusUpdatePerformanceEvent_key_get();
}
