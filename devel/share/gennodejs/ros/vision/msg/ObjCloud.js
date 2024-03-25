// Auto-generated. Do not edit!

// (in-package vision.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ObjCloud {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.size = null;
      this.points = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('size')) {
        this.size = initObj.size
      }
      else {
        this.size = [];
      }
      if (initObj.hasOwnProperty('points')) {
        this.points = initObj.points
      }
      else {
        this.points = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ObjCloud
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [size]
    bufferOffset = _arraySerializer.int32(obj.size, buffer, bufferOffset, null);
    // Serialize message field [points]
    bufferOffset = _arraySerializer.float32(obj.points, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ObjCloud
    let len;
    let data = new ObjCloud(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [size]
    data.size = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [points]
    data.points = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.name);
    length += 4 * object.size.length;
    length += 4 * object.points.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vision/ObjCloud';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '48039639e73b60b58ebc7de8fa9cef21';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string name
    int32[] size
    float32[] points
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ObjCloud(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.size !== undefined) {
      resolved.size = msg.size;
    }
    else {
      resolved.size = []
    }

    if (msg.points !== undefined) {
      resolved.points = msg.points;
    }
    else {
      resolved.points = []
    }

    return resolved;
    }
};

module.exports = ObjCloud;
