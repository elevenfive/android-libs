/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 3.0.12
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package io.ooni.mk.nettest.swig;

public class FailureCcLookupEvent {
  private transient long swigCPtr;
  protected transient boolean swigCMemOwn;

  protected FailureCcLookupEvent(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(FailureCcLookupEvent obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        mk_swig_nettestJNI.delete_FailureCcLookupEvent(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  public void setFailure(String value) {
    mk_swig_nettestJNI.FailureCcLookupEvent_failure_set(swigCPtr, this, value);
  }

  public String getFailure() {
    return mk_swig_nettestJNI.FailureCcLookupEvent_failure_get(swigCPtr, this);
  }

  public FailureCcLookupEvent() {
    this(mk_swig_nettestJNI.new_FailureCcLookupEvent(), true);
  }

  public final static String key = mk_swig_nettestJNI.FailureCcLookupEvent_key_get();
}
