Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4D424C67A
	for <spacemit@lists.linux.dev>; Thu, 19 Jun 2025 13:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750339405; cv=none; b=tQeKL0mSHlTHx8g1m9/+9doS29amVerh9emL6EJXIBeHZv7NPkhMTwoWn+wDvIYWJXBYe39sGg4W6kAjF5WVz6hkGkWcBrpY6rBWsKj7SiCCap+Kwie24miN5qVOWrsGPtcWLU49J7aUhpdcr6T/Dy8Yo3fUN1WPyV+4+deJh3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750339405; c=relaxed/simple;
	bh=1VIncuOXKXIdppmIXOnXByGjjj43tUTod0CayZIPC38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RToZn2Vt4PxI+p0Ts7mfpuhkxePF7dG7RhCBk3gkU+LT2fEEbt4JE3Rza5+6g+SLhZ2zXLJ1Z8fN4/vGsfwrSsOeCiu93xL02APTZXnWZs2SxvUQc8o7iqNNaYmLhLsgbKihWPXMMiAqJjSgmvU92pQ5dqvjIZNO0cwAAGjJm9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=uBJycqnh; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="uBJycqnh"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-40aa391ce1aso195245b6e.2
        for <spacemit@lists.linux.dev>; Thu, 19 Jun 2025 06:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750339403; x=1750944203; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/8CfBC2bXTzgQwWZYshC/feOH//kuqxuZpnRg/tZqBY=;
        b=uBJycqnhalK3yb6Ux0ER+XnH9OeJ2UGLhoTZTssJMQyoLuzb6LwB86NWDZyfydRV6N
         VonFIGONeJN0IZjNUXA4vR3npDTEteS9WZrrGdy9+4TMRjSslMWlbMiPNyK0IDXbcEAc
         ZDupBvht5BAQbElIaij5ybrwuixdQkg29VALm2oYl4x41o67YihcI4+a1qSGPVMDKTRh
         mDJpBoeZie6bLqSvkndZ9u1L+J3hrx/mFZcD4laMWIbJnHGt1lRdjBSOTEzf0cFupCZ2
         /dP7QpKt9/KP029TRDVRNCE+3GXuFr3d7SEUDDreChHGPvEBk2CYpVqHLF92w+TKbinE
         FdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750339403; x=1750944203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/8CfBC2bXTzgQwWZYshC/feOH//kuqxuZpnRg/tZqBY=;
        b=qURIwsVn43Jr95lj3Ft3EFZEA1x6oB3mTgtapxIUaA+Nve3UAXsUowSe0KgD839Zws
         rfVcmL2OD+vpJugVS++E/IOyeM8uwCL/G+9Yv2+8FENLCXyeCfwSFZpfSSu3QImxe7WU
         m1XYWrtNQpi0FmsvZcbJdiloGzZNyJ7naPX4cUqYregJ2VuTqhcWdZpfR/b4Xd4lgi5e
         h41vifHwsgV0THt7epU6/Jpb1WuQB3uMMIJeDVSpZDtS/VA+Sp/eLfxDZebCyG/+3mKh
         WWYP+MlBRCcUnOvxvbgplAYryPv1KExUIDXiQnz1F5F5XZ88K2e6NiqFK2HuTsaH5XqY
         sxjA==
X-Forwarded-Encrypted: i=1; AJvYcCXACt0nkYu7jzjaHbYQ2bYcbfv2ZpkZBxOH/BtTd0fo6/c2U+03cZIbBtckWMwzP0lLJ1jNY/wTqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzopWxzf9UTtW7R5//pcNyCZ2qtevezw2KiXsD8NPKboKQYVIAu
	Uj7spG2nx8gZSKmmgO+eqCil/b6dzHbgn0GN+27ijCPru1if+TcwUhrwTVaAqH1efvw=
X-Gm-Gg: ASbGncuNeHE4tuMfMOUAEqx6j2fB2ahV+LORZwch4ycAu7JFzPRsZTg40ViS9z3R9XW
	2mW7AVgYPcMG6wOiANL2yetkKIYQj/48tS3nfaAB8seUKAGdIMBGE/wHQSN/Ssch5G4ws0MR8DU
	W9s8KLT/4OUEeL0d4C0z0j+io+reddaRPSrGsTmS2U4mA3ejEFfsretyC1yl3I6NBe4BKf5ne2S
	klWB3gf+Q3/xwrzNCjGNFeEt8k7vpoy7cqXaY1o8PsfP6/Y458g25H9tudKdAqESMm33ia2A37d
	XbTyaCPBXyHwPC3hGLd72GmDCEtf8HTuLzudvTZNjxhoWQWv8FTfTCZj3dCE6Xupa6hukSdDHbg
	xei4M1ZxnkwHUGYubqWJPnTjzug==
X-Google-Smtp-Source: AGHT+IGY28hFmDr7ULoWj9fl8QS8bDjzI+smc76lgSZ1x1dv+k82B0BpK2D8Bz8W0iYI/okzRPVkRA==
X-Received: by 2002:a05:6808:2128:b0:3f4:1c2:874a with SMTP id 5614622812f47-40a7c23eabdmr13775263b6e.24.1750339403015;
        Thu, 19 Jun 2025 06:23:23 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a741b8837sm2759463b6e.46.2025.06.19.06.23.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 06:23:22 -0700 (PDT)
Message-ID: <13cd66da-dff4-4985-989d-d757fbae99e7@riscstar.com>
Date: Thu, 19 Jun 2025 08:23:20 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add support the SpacmiT P1 PMIC
To: Vivian Wang <wangruikang@iscas.ac.cn>, lee@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-2-elder@riscstar.com>
 <123a7558-fda9-4b56-b6ae-a29d704419ac@iscas.ac.cn>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <123a7558-fda9-4b56-b6ae-a29d704419ac@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/19/25 1:03 AM, Vivian Wang wrote:
> Hi Alex,
> 
> Before the patch body, there's a typo in the subject line: "SpacmiT" ->
> "SpacemiT".

Thank you, I will fix that in v2, which I plan to post today.

					-Alex

> On 6/14/25 05:01, Alex Elder wrote:
>> Enable the SpacemiT P1, which is an I2C-controlled PMIC.  Initially we
>> only the regulators will be supported.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../devicetree/bindings/mfd/spacemit,p1.yaml  | 86 +++++++++++++++++++
>>   1 file changed, 86 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
>>
>> <snip>
>>
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        pmic@41 {
>> +            compatible = "spacemit,p1";
>> +            reg = <0x41>;
>> +            interrupts = <64>;
>> +
> 
> (Not really a review, just a note.)
> 
> I couldn't believe it at first, but it looks like the SpacemiT K1 really
> does have PLIC interrupt 64 dedicated to receiving PMIC interrupt [1]
> over pin "PMIC_INT_N".
> 
> Regards,
> Vivian "dramforever" Wang
> 
> [1]: https://developer.spacemit.com/documentation?token=AZsXwVrqaisaDGkUqMWcNuMVnPb
> 
>> <snip>
> 

