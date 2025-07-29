Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E859239E60
	for <spacemit@lists.linux.dev>; Tue, 29 Jul 2025 21:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753823051; cv=none; b=ev3uKxbEFMXMuWUFEnqRwic8AbeUZcJX3ZjlfRHVZRfbXLofLfE81S0iCY70XHTI12OX23I+DcLjZv1v8/dB5ke0YlRncUJqQQ1LFFqgQONH9bNiolTTPOb2TfNJ5HkS6HzFx4sC41OG33xtqxlEhVnkS4ehqF6fOGfTLTdt8Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753823051; c=relaxed/simple;
	bh=7thQFiHMskvQ9aFUSWH6/ir2YyqLwdvvFhctZkjF81M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hoD/YLWC5KyZ3kej7gWM31OE6rF2RaRsUT+5Bjnja12+blXW0y4vW6DSrvELEky9BoxMeEaCela5agalY8qAzXki22eH9O9pcIcRs8XEt0Kjxj+xeJ9zjDNg8eyclsfthDyelYZQU6Y6fkg7kNVNw432/2MJcXkBtdwZ4Tv17yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=XORfBgzs; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="XORfBgzs"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-87999c368e9so511375839f.0
        for <spacemit@lists.linux.dev>; Tue, 29 Jul 2025 14:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753823047; x=1754427847; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dm0B5M26cYOXX5KrUOLsQ5vTboaxWnLdzB6XMUX6uWQ=;
        b=XORfBgzsIIsGSxQp4CJ0s7pUMbwTgCLGzkPsl5FJ+wbZIoQhZhMIaaKTkQ9VOg59Tw
         DeD53wjJE+20lZut6R+HRrPdVDBA9+huSZgxgay+GZgSsIvfAEisFG74DSVejpscz9/w
         a7MRVCyo96u56d9vn2hblQ3vxQyI8D7d3AO418JJOGUfyu3Qh9571lIbn5YRMRmi014M
         SfexV9eMmk9m3+Wm8oBFgl5MO4TaDi65BrG3MHAedZQZ0n2rJUvH/AKpn/tk6AUhXEJL
         FatcU4bdDvrMq4rw48xm9DVNNIDz1eG5qG5eqvYeVOH1iznoHcy0mAFkRm3KLhFH1fOO
         OW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753823047; x=1754427847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dm0B5M26cYOXX5KrUOLsQ5vTboaxWnLdzB6XMUX6uWQ=;
        b=DnE8aNiSJZfnjCDjJVVxjyfKsZO0/zmafdWGaqLx3hvb+2o+aL1BTPvdamzWsPVWMQ
         w+2VhJIliCFpTKDK8aCZBUmjTPjeS8zn6znekm64EBt4UCh0mt4l5nQZ0q9QAoKUXpfs
         Le/B1HnXWL0teqQ70QRs8M0fr2kT3vHNAO4QCKn3LNYv2U99kHSrGg7FU2cFJaFSiBq9
         pvZwIz1teoetGg1e0qSLWN7amOp3f2CQVpE+Hh1GvWppUBSDnEI2K567Zcnfg42VryHf
         gw+TFirHNjBp1ycVdpNC3yye6N1tO+IyhcB3vIg2rWzloEXG7pv7QM6k2ijKKnfWaq+X
         i5Lw==
X-Forwarded-Encrypted: i=1; AJvYcCV/3razz1UNldeN/Jy1Fw8wmjOsxoFFHNzW9qpL9+mX5+7ZQrACW96t0SSAItVJXcRyXG0M0RVdgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFfr3+cEVFvFmD8a3ram01lDcj7UXwJcbvfsb8ow0/AtTd69H7
	6bx0DQI83wI61AMBnGsk55Sw8FPWX1EjcNX96ndnlEPar3+d1U9O4qx1BBuP1/GH0iY=
X-Gm-Gg: ASbGnctMbh4CHCI4JaaJCJZsKV7SDEff6OpgKxxjilPcPnogFjZsY5JLh6EbPLtAy9o
	3S5dWr9zy0XE7XZzvP49xjA+j3Ilkxei3/bObDwjSN+pfBi2h7WxasPem5OgdAF1WAT//xo1ByB
	BNMGSkIQxVe0iY9K6qRZZVcunclsn3CmGjVWjymiLDZEdeogiZ3/URf8sKbOvIv8q40QymL2eht
	H4TKjPvskKCTkfXVRVX2XfraaY0KL7pAaB2D6QDdeGi1nkNhqSw5a5kkT1u9NoGr0Bz1EpT9s2O
	cTxyyzRfdSFTHnok9+21rTNVWtIofITFCww7RNzsuKHsdSbT4DPGGWWNe7zRdLamc0L1CV98yTN
	yMu1KEQq52oz4AoIHZix7suENiw2sGy5SNywXtYT+Y6NEs05ritMriCCX18Nj5w==
X-Google-Smtp-Source: AGHT+IEYsNZGToVFKqEpDm8h8KviUj+EbfOPDQ9fzvNi2gdCmg29FQdC20eQLL41P+j0nBILREZn0w==
X-Received: by 2002:a05:6602:7501:b0:879:c9db:cbf0 with SMTP id ca18e2360f4ac-881374c295emr155676739f.2.1753823047163;
        Tue, 29 Jul 2025 14:04:07 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-508c91f1dcfsm2827976173.47.2025.07.29.14.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 14:04:06 -0700 (PDT)
Message-ID: <5c3f9f10-6a9d-45b4-80c0-09402b35bf47@riscstar.com>
Date: Tue, 29 Jul 2025 16:04:05 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: serial: 8250: allow "main" and "uart" as
 clock names
To: Conor Dooley <conor@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, lkundrak@v3.sk,
 devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 spacemit@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20250728220002.599554-1-elder@riscstar.com>
 <20250728225319-GYA900803@gentoo>
 <20250729-reshuffle-contented-e6def76b540b@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250729-reshuffle-contented-e6def76b540b@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/25 12:54 PM, Conor Dooley wrote:
> On Tue, Jul 29, 2025 at 06:53:19AM +0800, Yixun Lan wrote:
>> Hi Alex,
>>
>> On 17:00 Mon 28 Jul     , Alex Elder wrote:
>>> There are two compatible strings defined in "8250.yaml" that require
>>> two clocks to be specified, along with their names:
>>>    - "spacemit,k1-uart", used in "spacemit/k1.dtsi"
>>>    - "nxp,lpc1850-uart", used in "lpc/lpc18xx.dtsi"
>>>
>>> When only one clock is used, the name is not required.  However there
>>> are two places that do specify a name:
>>>    - In "mediatek/mt7623.dtsi", the clock for the "mediatek,mtk-btif"
>>>      compatible serial device is named "main"
>>>    - In "qca/ar9132.dtsi", the clock for the "ns8250" compatible
>>>      serial device is named "uart"
>>>
>>> In commit d2db0d7815444 ("dt-bindings: serial: 8250: allow clock 'uartclk'
>>> and 'reg' for nxp,lpc1850-uart"), Frank Li added the restriction that two
>>> named clocks be used for the NXP platform mentioned above.  Extend that
>>> so that the two named clocks used by the SpacemiT platform are similarly
>>> restricted.
>>>
>>> Add "main" and "uart" as allowed names when a single clock is specified.
>>>
>>> Fixes: 2c0594f9f0629 ("dt-bindings: serial: 8250: support an optional second clock")
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202507160314.wrC51lXX-lkp@intel.com/
>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>> ---
>>>   .../devicetree/bindings/serial/8250.yaml      | 19 ++++++++++++++-----
>>>   1 file changed, 14 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
>>> index e46bee8d25bf0..cef52ebd8f7da 100644
>>> --- a/Documentation/devicetree/bindings/serial/8250.yaml
>>> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
>>> @@ -61,11 +61,17 @@ allOf:
>>>               - const: uartclk
>>>               - const: reg
>> ..
>>>       else:
>> would it be better to drop this 'else', and moving following 'if' block
>> to the same level with "nxp,lpc1850-uart"?
>>
>> the reason here would avoid too many indentions if add more constraint in
>> the future if other SoC uart need different clock-names..
> 
> I agree, it's more typical to do it that way I think to boot.
> 
> Also, why is there a k1/lpc conditional bit that is not part of the
> allOf in addition to the bits in the allOf? Can that get merged with the
> allOf please?

Are you talking about the blank line here?

     then:
       oneOf:
         - required: [ clock-frequency ]
         - required: [ clocks ]
                            <------ this blank line
   - if:
       properties:
         compatible:
           contains:
             const: nxp,lpc1850-uart
     then:

I didn't notice that before.  It got inserted with commit
d2db0d7815444 ("dt-bindings: serial: 8250: allow clock
'uartclk' and 'reg' for nxp,lpc1850-uart").

If so, yes I'll remove that as well when I update the patch to
get rid of the else as Yixun suggests.

Greg won't take this for a couple weeks so I'll hold off sending
v2 for a while.

					-Alex

