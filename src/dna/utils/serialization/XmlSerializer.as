/* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is nexuslib.
 *
 * The Initial Developer of the Original Code is
 * Malachi Griffie <malachi@nexussays.com>.
 * Portions created by the Initial Developer are Copyright (C) 2011
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *
 * ***** END LICENSE BLOCK ***** */
package dna.utils.serialization
{

import dna.errors.NotImplementedError;
import dna.utils.reflection.Reflection;
import dna.utils.Parse;

import flash.utils.*;

/**
 * ...
 * @author	Malachi Griffie (malachi@nexussays.com)
 * @since	7/23/2011 3:34 AM
 */
public class XmlSerializer implements ISerializer
{
	//--------------------------------------
	//	CLASS CONSTANTS
	//--------------------------------------
	
	//--------------------------------------
	//	INSTANCE VARIABLES
	//--------------------------------------
	
	//--------------------------------------
	//	CONSTRUCTOR
	//--------------------------------------
	
	public function XmlSerializer()
	{
	
	}
	
	//--------------------------------------
	//	GETTER/SETTERS
	//--------------------------------------
	
	//--------------------------------------
	//	PUBLIC INSTANCE METHODS
	//--------------------------------------
	
	public function serialize(sourceObject:Object, getReadOnlyProperties:Boolean = false):Object
	{
		throw new NotImplementedError();
		//return XmlSerializer.serialize(sourceObject, elementName, getReadOnlyProperties);
	}
	
	public function deserialize(serializedObject:Object, classType:Class = null):Object
	{
		throw new NotImplementedError();
		//return XmlSerializer.deserialize(serializedObject, classType);
	}
	
	public function toString(verbose:Boolean = false):String
	{
		return "[XmlSerializer]";
	}
	
	//--------------------------------------
	//	PUBLIC CLASS METHODS
	//--------------------------------------
	
	/**
	 * Creates an XML object representing the passed object instance. Only public properties are included, and Dates
	 * are converted to number of milliseconds since Jan 1, 1970 UTC
	 * @param	sourceObject	The object to convert to XML
	 * @param	elementName		The name of the root element. If null, the name of the object's class is used.
	 * @return
	 */
	public static function serialize(sourceObject:Object, getReadOnlyProperties:Boolean = false):XML
	{
		/*
		var type:String = getQualifiedClassName(sourceObject);
		var xml:XML = new XML("<" + (elementName || type.toLowerCase().substring(type.lastIndexOf(":") + 1)) + " />");
		xml.@type = type;
		var props:Object = Reflection.getPublicPropertyValues(sourceObject, getReadOnlyProperties);
		for(var prop:String in props)
		{
			if(props[prop] is Date)
			{
				xml[prop.toLowerCase()] = (props[prop] as Date).getTime();
			}
			else
			{
				xml[prop.toLowerCase()] = props[prop];
			}
		}
		return xml;
		//*/
		throw new NotImplementedError();
	}
	
	/**
	 * Creates an instance of the passed class from the passed XML data
	 * @param	sourceXML	The XML to source the object from
	 * @param	classType	The type of object to create. If null, the Class type is derived from the "type" attribute of the root XML node
	 * @return
	 */
	public static function deserialize(sourceXML:XML, classType:Class = null):*
	{
		/*
		classType = classType || Class(getDefinitionByName(sourceXML.@type));
		var result:* = new classType();
		var props:Object = Reflection.getPublicPropertyValues(result);
		//loop through the properties of the object, not the XML
		for(var prop:String in props)
		{
			if(sourceXML[prop.toLowerCase()])
			{
				if(result[prop] is Boolean)
				{
					result[prop] = Parse.boolean(sourceXML[prop.toLowerCase()], false);
				}
				else if(result[prop] is Date)
				{
					result[prop] = new Date(Parse.number(sourceXML[prop.toLowerCase()], 0));
				}
				else
				{
					try
					{
						result[prop] = sourceXML[prop.toLowerCase()];
					}
					catch(ex:Error)
					{
						//trace(ex);
					}
				}
				trace(prop, "xml: ", sourceXML[prop.toLowerCase()], "result: ", result[prop]);
			}
		}
		return result;
		//*/
		throw new NotImplementedError();
	}
	
	//--------------------------------------
	//	PRIVATE INSTANCE METHODS
	//--------------------------------------
	
	//private final function trace(... params):void
	//{
		//Debug.debug(XmlSerializer, params);
	//}
}

}