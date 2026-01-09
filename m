Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846CB42050
	for <spacemit@lists.linux.dev>; Fri,  9 Jan 2026 05:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767936113; cv=none; b=oE/bdsO8H8XkLQnYzAg/3KKveQwLdgH3GFEAdPdCL8uKPc/0iVj2cZJdx0d4/T4ufr+iRZco8VBVu7XNgJ9UqvU7rI0Rlvv/IhNaftn3pYHoHAkkk6rchgD6UgTagvOEEyqZcF385U60aIjCsg4wTwPE40JS6wxdjSvwF2mNueo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767936113; c=relaxed/simple;
	bh=ADwpTdsppeYwljABSoUx9GoAFRvWMw51o2qqxcvypPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mqVggpSpqG1TytniR0RluVkXbq4K5siyY1Kv+RlbPvepZoceopDgqjKICGl/UYp0PNc562R0WEUt/CloRqEpHjYw/OM1j1PYwEme1FZBidy2ztmBNB7/i23YScVoxwoTT45l76BJ0WRLjrzVVr+QNBkWwtOT3y4D20Yqm1c1fH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=OvtR6/TC; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="OvtR6/TC"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7c75178c05fso1557499a34.0
        for <spacemit@lists.linux.dev>; Thu, 08 Jan 2026 21:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1767936110; x=1768540910; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2a7yb61gjMTGmEOfZ9bR3veEdxmzKhIWW1FkPKIznT4=;
        b=OvtR6/TCrCO+Tlz8mBAH3nVmcfpPewlG4ZelrFXyfYEZmIv2Nf5PYYLVd6CcmEhugB
         HVJUpuM0fKMhuARdPfsF9QyRi19URzF58OuyILYhMPceRvQLB0YuwFOKXbr81XLN9Tme
         rzNdiZV0rZIyIP/ULPiqBSN3UZDpKGbx83AVSrQ0xzMMrGy0a9YR6ub8iQUFCn8HH4he
         Kq86jFS2xaxaWtN27RwvuryLe3tIybhRpwxsrohNT80Eoix3TDBK0eMZ2kVGZquskxut
         4RKUx/2/4QvV22dw1dt01J/2y01c+BfWoczjD2O9XWHWlRqOJxlOOgUMPR+2YyIKfTAW
         jlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767936110; x=1768540910;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2a7yb61gjMTGmEOfZ9bR3veEdxmzKhIWW1FkPKIznT4=;
        b=eUhl84yG0NIHvqhaihqH2oUTJgIZGPuGURlM0Qoz5sVahHPl4Z1G6glVmlqKESdLwY
         yuok4CaY5FBDqxjGIh7dXTCgG8r4/GDHgYaJmQsIys9PSIiOcDwG6/7fj/4reXGfn5zP
         /G005GreTij1agevb74JLHJw+HvbgdWxZz5uBK6d2scK1g9KrnAGDib7wn2RaKs8OeyE
         gzKHVCMpQGs/ZBajQ5q4xsnFgNrRWY9UTlljAMFCPqXxD2HSEfIatMBXeXeyJX3GN4na
         qRijQ7HS8ET2dCZpu6G4u1zwcYFFpqF/Eca6FwkTvkwgEUt9MvAPz3N77dhARSKgs7OH
         D4aA==
X-Forwarded-Encrypted: i=1; AJvYcCXRUNcAwstaS1h5Q6x6hgvCiAZKiC29dHLWevEQuO4Xd4jSe3sGxD4qi97BVABgARoYbnA/gBTuYg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmZ4Lmn7IoP8JdCr/ntaZ1+ZVAXOtRhiKgEYd+im3S9iZqSLi1
	s7bdrllOypYgYUKIqb+r8+Ot/zr+OgWlYDHl7j2uPiv+/svvsAgMNW/oIQ+J9vUkWqY=
X-Gm-Gg: AY/fxX7V4JQ9w0uMxDmQcbHf4oFqzUKvI785ExOOtoxhv1EGLGVAh3SwcmsdDE1klkU
	xQlpoc0V4gBRmyO9YUopNWhZ5fC/FsjfpRFKndxfLLT28J2+v938ZuKZppZjpvqv/qRsBGoI403
	QBSY+nQCscyWbGcWlPx1heJk+h/eyYKabiyEyVRESkQaoYgtJesEYMh0ax5BysWu2CG3la5Gbkq
	pMVlW8cxP0jHlXd/zBOfdRCJmKCRdgSDbjb28yOsN02EwZWp5+xCDGO0LHhHhHIOyB97hsVFhpl
	O+HrH2C1IE+oqDvfRAgt6hrPjAsCR1FZTdV3Yfww+CfnpjRc7doNYqg0e74ISzVekx5/bOnrgXt
	+dMc79D9kp5Z5mJ6ysYoiGaGnXmfZ4j9QYjO1sizVxmeh5sFD2HwASUWuTtrUOaztoT7ZHdfJjy
	NQ5BXZwEZ7Tdbp1NRbFwBjld+zJOE=
X-Google-Smtp-Source: AGHT+IGR9G9QsQo8PdDgYo3rev7ih0hABMziC59pD3OHlqcWicc9e+z0NWSuSaiPEPFAI2FDHSqogA==
X-Received: by 2002:a05:6830:230c:b0:7c7:1c77:f107 with SMTP id 46e09a7af769-7ce50c0b0d5mr5519693a34.34.1767936110408;
        Thu, 08 Jan 2026 21:21:50 -0800 (PST)
Received: from [100.64.0.1] ([170.85.11.86])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478d9f54sm7079938a34.23.2026.01.08.21.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 21:21:49 -0800 (PST)
Message-ID: <5c54077c-f9fd-40c9-84eb-54139db8aaa6@sifive.com>
Date: Thu, 8 Jan 2026 23:21:48 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: Enable USB3.0 on BananaPi-F3
To: Ze Huang <huang.ze@linux.dev>, Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, Aurelien Jarno <aurelien@aurel32.net>
References: <20260107-k1-usb3dts-v2-v2-0-e659b0f8fe1a@linux.dev>
 <20260107-k1-usb3dts-v2-v2-3-e659b0f8fe1a@linux.dev>
 <20260108012157-GYA2355@gentoo.org> <20260108113605-GYA4052@gentoo.org>
 <aWB-6UkudFit3ZBX@monica.localdomain>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <aWB-6UkudFit3ZBX@monica.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ze,

On 2026-01-08 10:07 PM, Ze Huang wrote:
> On Thu, Jan 08, 2026 at 07:36:05PM +0800, Yixun Lan wrote:
>> Hi Ze,
>>
>> I've done a quick check of the "regulator-always-on" issue, 
>> it's ok to drop the one from hub, but not the vbus one..
>>
> 
> Thanks for your double check
> 
>> On 09:21 Thu 08 Jan     , Yixun Lan wrote:
>>> Hi Ze,
>>>
>>>   thanks for your patch, I have few comments, see below..
>>>
>>> On 20:05 Wed 07 Jan     , Ze Huang wrote:
>>>> Enable the DWC3 USB 3.0 controller and its associated usbphy2 on the
>>>> Banana Pi F3 board.
>>>>
>>>> The board utilizes a VLI VL817 hub, which requires two separate power
>>>> supplies: one VBUS and one for hub itself. Add two GPIO-controlled
>>>> fixed-regulators to manage this.
>>>>
>>>> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
>>>> Signed-off-by: Ze Huang <huang.ze@linux.dev>
>>>> ---
>>>>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 48 +++++++++++++++++++++++++
>>>>  1 file changed, 48 insertions(+)
>>>>
>>>> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>>>> index 3f10efd925dc..013df91c6a4c 100644
>>>> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>>>> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>>>> @@ -59,6 +59,26 @@ reg_vcc_4v: vcc-4v {
>>>>  		regulator-always-on;
>>>>  		vin-supply = <&reg_dc_in>;
>>>>  	};
>>>> +
>>>> +	usb3_vbus: regulator-vbus-5v {
>>> I've checked the schematics, the name is 5V_VBUS there, so for the consistency
>>> with previous naming convention, let's change to:
>>> 	usb3_vbus_5v: usb3-vbus-5v 
>>>
>>>> +		compatible = "regulator-fixed";
>>>> +		regulator-name = "USB30_VBUS";
>>>> +		regulator-min-microvolt = <5000000>;
>>>> +		regulator-max-microvolt = <5000000>;
>>> ..
>>>> +		regulator-always-on;
>>> do you think the "always-on" property really necessary? it indicate the
>>> power regulator is critical, and should never been disabled even during
>>> suspend/resume state, for the case of USB, I think it should be totally
>>> fine to poweroff once the device is not used(suspended) or even disabled
>>>
>>> besides, the regulator is designed with a gpio enabling/disabling control
>>> which means it can be powered to on/off state?
>>>
> 
> 
>> not ok to drop, see comment below at &usb_dwc3 
> 
>>
>>>> +		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
>>>> +		enable-active-high;
>>>> +	};
>>>> +
>>>> +	usb3_vhub: regulator-vhub-5v {
>>> why use vhub, but not hub? where does this name come from?
>>>
>>> and for same reason, the name in schematics is VCC5V0_HUB, so how about
>>> change it to:
>>> 	usb3_hub_5v: usb3-hub-5v 
>>>
>>>> +		compatible = "regulator-fixed";
>>>> +		regulator-name = "USB30_VHUB";
>>>                                     ~~~need to fix too, if above is valid
>>>> +		regulator-min-microvolt = <5000000>;
>>>> +		regulator-max-microvolt = <5000000>;
>>> ..
>>>> +		regulator-always-on;
>>> ditto
> 
>> ok to drop, as it's already handled at drivers/usb/misc/onboard_usb_dev.c
>> which will explicitly request the regulator and enable it
> 
>>
>>>> +		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
>>>> +		enable-active-high;
>>>> +	};
>>>>  };
>>>>  
>>>>  &combo_phy {
>>>> @@ -67,6 +87,34 @@ &combo_phy {
>>>>  	status = "okay";
>>>>  };
>>>>  
>>> ..
>>>> +&usbphy2 {
>>>> +	status = "okay";
>>>> +};
>>>> +
>>>> +&usb_dwc3 {
>>>> +	dr_mode = "host";
>>>> +	vbus-supply = <&usb3_vbus>;
>> due to drivers/usb/dwc3/dwc3-generic-plat.c has no handler to request regulator
>> there will be problem if "regulator-always-on" property is removed..
> 
> On the BananaPi-F3 and to Jupiter, the VL817 hub setup uses two distinct controls:
> 
> GPIO97  controls the physical VBUS supply.
> GPIO123 controls the VCC5V0_HUB supply for the hub logic.
> 
> (Note: This differs from the Orange Pi RV2, where only GPIO123 is used to
> control the VBUS supply).
> 
> dwc3-generic-plat can not currently handle the regulator request explicitly,
> keeping "regulator-always-on" forces the VBUS to remain active even when
> suspended, which consumes unnecessary power.
> 
> I prefer to drop regulator-always-on in the DTS to accurately describe the
> hardware capability, and let the driver manage the VBUS state. This ensures
> better power management.
> 
> If anyone have other ideas, please let me know.

If a USB device requires board-level resources to function, then the USB device
itself (not the controller) needs a DT node that references these resources.
This is the purpose of the usb-device.yaml binding. For the VL817 hub, there is
a specific binding that links the highspeed and superspeed hubs together. See
Documentation/devicetree/bindings/usb/vialab,vl817.yaml. These nodes are matched
with the Linux usb-onboard-hub driver.

Regards,
Samuel

