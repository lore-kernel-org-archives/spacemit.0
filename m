Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895AF213E85
	for <spacemit@lists.linux.dev>; Tue, 29 Jul 2025 21:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753824963; cv=none; b=ceAvyhXasyZKr5jNMs5zQIjr7cJLcboKvUnXGonchugUR98+5fDBEiL4VChIu71amaNjkw9Dg/b9V0do7+ZoNkHmR5wmZ+JUsJOKuxlnfEo2RLByJVKtMnjuv3QjD6b1oweNhH1LLJzUgnTQRiI9/kGHuTHF0dcQ34HZVNajTpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753824963; c=relaxed/simple;
	bh=TrgIz2OT4qDkw7/yxDSJfKcyMf8vlrlfJceE81V2yjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gu0NHjkz0rXuY9s97zD3tDyKZxeOhk04JHM3cT/mwEru984WdjqEguzNrkYdpgiEsnQZkvCFQCZxfH8JqYAxY5chBAVi2SteB4y7w4foYdSz7dpmssn+wK3+hzs1fo6lcWBqbdpDqCrwyJCIBEOBHLE/BVFPaDdkp7h46tSGV5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=WnMu2l6v; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="WnMu2l6v"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-879c737bcebso12116939f.0
        for <spacemit@lists.linux.dev>; Tue, 29 Jul 2025 14:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753824959; x=1754429759; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T6TTijnB+mf1Tx70AUpgzd27gcsp61CTxKy/bu5Mf0k=;
        b=WnMu2l6vNBuMStx8dUVqYIf74wU7oyJ4vekDrLNx79u7/uWPAc/TOAakKismmucq03
         b5vgnpRsT404m8laGO4dRmg4U/jK7rb/WCUVLsexeqDKnUSz1DtTxkN+8QB7SjcdJaEn
         g5CcJ8BEB4UsQPXwaP1BFNBvqAfZL8/8E3ualVFP2DPb2TpJfjVlCrwsL+GqIfSAyf8I
         1VIpKBXPUzqjLoDUJ2JBrVJ149/DCI/ukkc+cItmk9klTaOZ9sRhVW7jN4/7j80sFRgn
         RFziAsm2QlPBYD0aYua1IyeEOn0cPsmCrt1140b/KMN/VR4YQ7nvDNpHMTFsnXrZOYwq
         dVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753824959; x=1754429759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T6TTijnB+mf1Tx70AUpgzd27gcsp61CTxKy/bu5Mf0k=;
        b=Ahl73xqvVts6IX2MBhs1rFq+bZ/MfuHhDhdJulVbGbPGWnttyXkrWWt2KzdFJHLSm6
         rBzMozG4oYmhfuAkOwxW+iTFVWgW3xfNrYHwYMLL27oqwdHgVPtWrl6EmCX/2ORKd8O2
         1nhDd3xZsGpZcfn84qPaKHRIwPxGY+GTDKHGM/VGW2OzEd7iuir7smuzYiX5gz40eXvy
         RRXEMs3XH+b/PjXXBamKv2kOuwdlIq20dspjja7qZu3MtonATl2GvXaUPZqpy4PrEqAM
         5VCCpSVARibSXPshMgytEuywy+zNBlLOP+czYEMImOLXJa7NMRAWJyh5X/6/ieqd1aNq
         osjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6YGSot5q/1/wp+nN7rgUnDD5VkhRb6OlAmtG4Tk192TlpPofTkFLUAVVvjr6Mupyw6VSCNIQfXg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxu/Zx9BzSrzTFahHRxmqaTFYW90nD1B6tDmKYOQvyy0ZXgdUqI
	oVoHJr50MQVpaMMpeseWqJP9/Q/uMHDHtabZ1XhDMXJS2ijkgxrhT6yKBmfzbLmD1Bxo/BZ+IW7
	zrJJB
X-Gm-Gg: ASbGncvmip1PcnpH5O2vOaB1/y51ec59WBZDwJ8FC6hmyRLUdimKLSf3K5yLQU2S+Wf
	lbXko0XroRvZIjfO9ZdOHxCKgH+Sw9WDMKiWgfcaFG9+8hogAyGBYjiWIIVZVTrkYuLHRmUDaBU
	SkKU4+Tr5pxjzXluPxQ92QJwsC4ZRfbnygywKXEDIuJhTB2dcTNwgMT95B1vCHPOKhZ4vAz44LH
	kicfCXCMk33xQSOaoPMKRXZOSqn+RUiAyUdoH+6mhbTe2r95Ba1Golfsle3jIDQb/jKDDoHuN/8
	nv/3zkI733M9PAhJNdpc+viRabG/sB1GNCiXRRsUOjr6tDAZSm+QF6njjErwQXbX5JVsKPg5r3p
	9f3sY5y0vkz7XhowL8PeWWEZiZpsdMOF4KRO03+cEMLJK7vJOiV3DDBk2lP3tLQ==
X-Google-Smtp-Source: AGHT+IH9yMoT3SyI/T66ZtxcPnZNldk6FIOoyhUi5kHT3q4ZE7dn1hQwAMIQq+oM/1pZl9ARWn7tQA==
X-Received: by 2002:a92:db50:0:b0:3e3:b3d0:26cf with SMTP id e9e14a558f8ab-3e3e97254b5mr53179065ab.10.1753824959544;
        Tue, 29 Jul 2025 14:35:59 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-508c9343739sm2781465173.69.2025.07.29.14.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 14:35:59 -0700 (PDT)
Message-ID: <79fde2dc-2370-4ec8-94eb-57715cfc2806@riscstar.com>
Date: Tue, 29 Jul 2025 16:35:57 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: serial: 8250: allow "main" and "uart" as
 clock names
To: Conor Dooley <conor@kernel.org>
Cc: Yixun Lan <dlan@gentoo.org>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, lkundrak@v3.sk,
 devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 spacemit@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20250728220002.599554-1-elder@riscstar.com>
 <20250728225319-GYA900803@gentoo>
 <20250729-reshuffle-contented-e6def76b540b@spud>
 <5c3f9f10-6a9d-45b4-80c0-09402b35bf47@riscstar.com>
 <20250729-clench-hastily-b80f11f73336@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250729-clench-hastily-b80f11f73336@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/25 4:08 PM, Conor Dooley wrote:
> On Tue, Jul 29, 2025 at 04:04:05PM -0500, Alex Elder wrote:
>> On 7/29/25 12:54 PM, Conor Dooley wrote:
>>> On Tue, Jul 29, 2025 at 06:53:19AM +0800, Yixun Lan wrote:
>>>> Hi Alex,
>>>>
>>>> On 17:00 Mon 28 Jul     , Alex Elder wrote:
>>>>> There are two compatible strings defined in "8250.yaml" that require
>>>>> two clocks to be specified, along with their names:
>>>>>     - "spacemit,k1-uart", used in "spacemit/k1.dtsi"
>>>>>     - "nxp,lpc1850-uart", used in "lpc/lpc18xx.dtsi"
>>>>>
>>>>> When only one clock is used, the name is not required.  However there
>>>>> are two places that do specify a name:
>>>>>     - In "mediatek/mt7623.dtsi", the clock for the "mediatek,mtk-btif"
>>>>>       compatible serial device is named "main"
>>>>>     - In "qca/ar9132.dtsi", the clock for the "ns8250" compatible
>>>>>       serial device is named "uart"
>>>>>
>>>>> In commit d2db0d7815444 ("dt-bindings: serial: 8250: allow clock 'uartclk'
>>>>> and 'reg' for nxp,lpc1850-uart"), Frank Li added the restriction that two
>>>>> named clocks be used for the NXP platform mentioned above.  Extend that
>>>>> so that the two named clocks used by the SpacemiT platform are similarly
>>>>> restricted.
>>>>>
>>>>> Add "main" and "uart" as allowed names when a single clock is specified.
>>>>>
>>>>> Fixes: 2c0594f9f0629 ("dt-bindings: serial: 8250: support an optional second clock")
>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202507160314.wrC51lXX-lkp@intel.com/
>>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>>>> ---
>>>>>    .../devicetree/bindings/serial/8250.yaml      | 19 ++++++++++++++-----
>>>>>    1 file changed, 14 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
>>>>> index e46bee8d25bf0..cef52ebd8f7da 100644
>>>>> --- a/Documentation/devicetree/bindings/serial/8250.yaml
>>>>> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
>>>>> @@ -61,11 +61,17 @@ allOf:
>>>>>                - const: uartclk
>>>>>                - const: reg
>>>> ..
>>>>>        else:
>>>> would it be better to drop this 'else', and moving following 'if' block
>>>> to the same level with "nxp,lpc1850-uart"?
>>>>
>>>> the reason here would avoid too many indentions if add more constraint in
>>>> the future if other SoC uart need different clock-names..
>>>
>>> I agree, it's more typical to do it that way I think to boot.
>>>
>>> Also, why is there a k1/lpc conditional bit that is not part of the
>>> allOf in addition to the bits in the allOf? Can that get merged with the
>>> allOf please?
>>
>> Are you talking about the blank line here?
> 
> No, I'm talking about what's down around line 270 in the binding.

Oh wow that's in a weird spot, and it might be redundant?

Anyway I'll work on getting that fixed too before I send
my next version.

					-Alex

>>
>>      then:
>>        oneOf:
>>          - required: [ clock-frequency ]
>>          - required: [ clocks ]
>>                             <------ this blank line
>>    - if:
>>        properties:
>>          compatible:
>>            contains:
>>              const: nxp,lpc1850-uart
>>      then:
>>
>> I didn't notice that before.  It got inserted with commit
>> d2db0d7815444 ("dt-bindings: serial: 8250: allow clock
>> 'uartclk' and 'reg' for nxp,lpc1850-uart").
>>
>> If so, yes I'll remove that as well when I update the patch to
>> get rid of the else as Yixun suggests.
>>
>> Greg won't take this for a couple weeks so I'll hold off sending
>> v2 for a while.
>>
>> 					-Alex
>>

