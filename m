Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E4C3D6CDD
	for <spacemit@lists.linux.dev>; Thu,  6 Aug 2026 19:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786044663; cv=none; b=WQ+9FVc045Mej+RkNWc7IQY0FKBX/5zG5tSe0i5nIpJRvq+qajbSdc/8Rr1fT7H+G9x8BCAh+0fFdmya9XZHY7wOAX61z0XcbKb090Vy/qBnLihWp6DzMe5uTB/62Loy1vpN7ORuw/flvCxoTuGsunf10Cit+iYa8pCkgSnc+Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786044663; c=relaxed/simple;
	bh=4tx9NSGNynTF4PHpWC7vIVZqpu7kF9vx/gpj/G0H91k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyau+BORsuwcu2xxKLMmJEdGqyFJOgDc0QamvEiX8HVvOSDybRd9I4sSF/yWXXgma6LzKPyjIolXVrumLJosEFQ5x1bEevKLHRGQqTwL7+aJK9cybdzvIBy0jAomR4zqy3Bhrqwka8M8gmM2aA7IVSEHPPsrZYAAElyhAZ6BJFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0wCB6yC; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0wCB6yC"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d049069377so28454025ad.0
        for <spacemit@lists.linux.dev>; Thu, 06 Aug 2026 12:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786044661; x=1786649461; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=96I6v/AKBNTvV/KdjO4chCrzAPiR9Nz0WdXHIejWW6U=;
        b=O0wCB6yCEJ6X09Z/wfDk6yEYS3x4lHvQaO4QbaVDJpDLhGHvO7O1mCzBNDOF932uDc
         rsQribIX6u8LN03wS7LjEU29js6B65GfbnMltwrmF/Lmqa/jQxAzP6wB4mzKMJqTuSWj
         2rImBJ/GoSlLptyIKhRyUsNAskV1+cefXeTWPX1yeFmu8QSG1BCZllkJUQAEVESaz+Xx
         Xb50RGYyQ0+YZll93j/0nog3bYJ+uDeJyTUdU61Ini5yTbTsvaMR5yvblyySgtOE2agG
         oO07Xr45ybZ8FCa2czD9a3q/Z1Yow5H8IAnb9X7/bYkqBtX0Z2cSjpTAUYeBKT0qS6tc
         DvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786044661; x=1786649461;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96I6v/AKBNTvV/KdjO4chCrzAPiR9Nz0WdXHIejWW6U=;
        b=SOx+UGVTsIYOmk48Woxd7s5SR6+bD7lrKKIClaRKa8sASGM5n8kw4beqvVoHTFcsTX
         unQovUC+DIGkjW5ZGuJmcMpNKYpHdSPxuzFwBjnKKeQAEifx2/fZ4ftxK1NogWkGLkGz
         ICOAbSr8fHQJtX+b/8t1Y+UyJ5yHxIgF5I4CHfqSWkYPmLTZBtHm/Q9UqDCLDtdW/b4H
         de6KNhQW6Lu0X0sHU4ktu3wW8Vy5fqSmaTcsqsDxWLzE0kTT3MY+47JkjH4rqnE3cwzt
         lG8qqYHQgqXIvd7mflHyTRcopBUIedu3+pdBbBjmofJQESxhr5rDNJYiNpyLtlzLtDQn
         SIkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9SCKCzEnXzjf8E+5RTj2lP3Dz3SA9PNaWXLmi7KPGZ8eXvyGkjSccX5S4335E6MSvCGKm1KZfoQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi0ruhwoSkV0t6jafhD32QoieSLd00+nYJBdY8QMgGrex1OZrQ
	MFQxVGqibWs4sb40q1sX1YfYlV44OrXzsX3zwZNbYhfbTcoX7u6edhLj
X-Gm-Gg: AR+sD109onMPgdFFSdSq8p1sdHvI5uAwMOmxr1r+jyTzH1ALFWPc/zIxO98LjmfHd6P
	LTn4hkC2GK/EkeiGER42uBqnM5yWnloDs7cxEB0Rq5YAqTt/5hQGiYqQ4cuA1uYWsKkjLW6vuuR
	jfBfRuMOcgH3oZAVFTrVq+2Q38shhHWjUL5nz5lD9rnrUJwuHTVZspu+1MIewNvwRWFLKYVTbjQ
	19qGbUM8jLb2ZLWdbjY7CcyGgobnHlOMQ3gccapg8GEaOD5scTTUi8YVeZ4lU3zjUPHPgYjWoEr
	Huz/5/QFGo2tDWHCh9ypisk9P3hyFwgeLnu7EAOkxzDTEuxgQRr9QXoZP1Faz/PQS6zm0yTZivq
	A1L7OjHMO/0OXyzryPDsC+rwrl320nOlXhxoC3SB23AV0YeYqiF7AMbec6ic+gercwfVfEM9Yx6
	uArNlwHCyb1SY+VPxmFN1/GNrVI8DS6SbPCKdvEvtcaB1GLrk+3pBw10Ygaa+wFFUhg4dZPpB1z
	3U=
X-Received: by 2002:a17:903:1a83:b0:2cc:307c:51fc with SMTP id d9443c01a7336-2d106e81d72mr45720725ad.21.1786044660266;
        Thu, 06 Aug 2026 12:31:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d120c611casm1084905ad.83.2026.08.06.12.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 12:30:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 6 Aug 2026 12:30:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v3 4/6] hwmon: (lm63) Add Sensylink CTF2301 support
Message-ID: <977654fc-d5e1-4d23-8ab3-286acd2dc372@roeck-us.net>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
 <20260805-ctl2301-v3-4-b86c75d1c552@linux.dev>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-ctl2301-v3-4-b86c75d1c552@linux.dev>

On Wed, Aug 05, 2026 at 02:00:54AM -0700, Troy Mitchell wrote:
> Add Sensylink CTF2301 support to the LM63 driver. CTF2301 follows
> the LM63-style temperature, tachometer, and PWM register layout,
> while using a 12-bit local temperature register and requiring the
> ALERT/TACH pin to be configured for tachometer input.
> 
> Register an optional thermal cooling device when the device tree
> node provides #cooling-cells, allowing thermal zones to control
> the fan through the existing PWM path without changing behavior
> for existing LM63-family users.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  Documentation/hwmon/lm63.rst |  22 +++
>  drivers/hwmon/Kconfig        |   8 +-
>  drivers/hwmon/lm63.c         | 414 +++++++++++++++++++++++++++++++++++--------
>  3 files changed, 366 insertions(+), 78 deletions(-)
> 
> diff --git a/Documentation/hwmon/lm63.rst b/Documentation/hwmon/lm63.rst
> index 9e27367d7405..c40bd0dfe591 100644
> --- a/Documentation/hwmon/lm63.rst
> +++ b/Documentation/hwmon/lm63.rst
> @@ -33,6 +33,16 @@ Supported chips:
>  
>  	       http://www.national.com/pf/LM/LM96163.html
>  
> +  * Sensylink CTF2301
> +
> +    Prefix: 'ctf2301'
> +
> +    Addresses scanned: none
> +
> +    Datasheet: https://www.sensylink.com/upload/1/net.sensylink.portal/1689557281035.pdf
> +
> +    Register description: https://github.com/TroyMitchell911/ctf2301-datasheet
> +
>  
>  Author: Jean Delvare <jdelvare@suse.de>
>  
> @@ -62,6 +72,8 @@ value have to be masked out. The value is still 16 bit in width.
>  
>  All temperature values are given in degrees Celsius. Resolution is 1.0
>  degree for the local temperature, 0.125 degree for the remote temperature.
> +The CTF2301 local temperature input and limit have a resolution of 0.0625
> +degree.
>  
>  The fan speed is measured using a tachometer. Contrary to most chips which
>  store the value in an 8-bit register and have a selectable clock divider
> @@ -93,3 +105,13 @@ support these GPIO lines at present.
>  The LM96163 is an enhanced version of LM63 with improved temperature accuracy
>  and better PWM resolution. For LM96163, the external temperature sensor type is
>  configurable as CPU embedded diode(1) or 3904 transistor(2).
> +
> +The CTF2301 is register-compatible with the LM63 family and provides 12 fan
> +control lookup table entries. It supports 8-bit PWM resolution when configured
> +for a 22.5 kHz PWM frequency.
> +
> +Device tree nodes may declare ``#cooling-cells`` to register the fan controller
> +with the thermal framework. The cooling state is mapped to the existing
> +``pwm1`` range from 0 to 255. The driver keeps the current automatic or manual
> +fan control mode during probe and switches to manual control when the thermal
> +framework first requests a cooling state.
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 2bfbcc033d59..abb1af8664fb 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1501,10 +1501,10 @@ config SENSORS_LM63
>  	depends on I2C

This seems to be missing the THERMAL dependency as suggested by Sashiko.

...
> -enum chips { lm63, lm64, lm96163 };
> +enum chips { lm63, lm64, lm96163, ctf2301 };

Alphabetic order, please.

> +		if (data->kind == ctf2301) {
> +			msb = i2c_smbus_read_byte_data(client,
> +						       LM63_REG_LOCAL_TEMP);
> +			lsb = i2c_smbus_read_byte_data(client,
> +						       CTF2301_REG_LOCAL_TEMP_LSB);
> +			if (msb >= 0 && lsb >= 0) {
> +				data->temp8[0] = msb;

Why keep the assignments to data->temp8[0] and data->temp8[1] ?

Thanks,
Guenter
