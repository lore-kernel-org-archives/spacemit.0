Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB752749C5
	for <spacemit@lists.linux.dev>; Wed, 22 Oct 2025 04:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761107659; cv=none; b=dvD/8kOLbJjstJlk2hrJzv9UHoZiok282jvB27C73zMYF0Moqg3hLYL9h0Tf2ThmpDshe6LdFFewx8y9yAaQH9cGBUPmixkQBEyc6nLRblSMjdo4n3HEIE582G6ZPqZLyrWSG9lx0Z6Yt6HW8dewuusqNIAa4TfJIP9Vsk2oCFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761107659; c=relaxed/simple;
	bh=Ta3vLBQn3sKyycsd6zk6kL1yNYlGExTdBO+VCjlMbt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pjy18q6uTWNEeUpg5Xh9MkNlNRSuEmjMopHMtwAZTZ7Dmi/+Hm9VkSP5IMJn65r1KXNnuwxAaEyw7VakafczyjIMCcW84N5+Z6EAaXOudOorIZGJM58NM8Xqw81JY7N6iwQKsYs4wsS/k6DQk1fqpOqP6wjV03avtAJpw9fYgLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=rjnlIqM1; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="rjnlIqM1"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-269639879c3so60414725ad.2
        for <spacemit@lists.linux.dev>; Tue, 21 Oct 2025 21:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761107657; x=1761712457; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ppwCPMx8V2Sf6deae1nCYy7pnPOnc4IDjA11Y0/2goo=;
        b=rjnlIqM17lPdb1/prCp+jItOWMHTqH/P5xdB5fzhGb8LW/oY9kmLy5lVF1zv7Y1vOE
         uVhsIrCfCtKGO/HY20KX85n8cF2TBOzAXPkTdh3dg5FrokdfahqSFJ/Rt33Ib5nr0GlN
         r12Y/YQA/hYYCzmc9v5rfZtkiAaAa7lpBaH0JCbNnwb6rgI5AenfUMLIvenGnBdONAXq
         Zu4QmDfO0UHIZOmtcGjYcYkDJ9wX/mHnpFXZPq8zIC2CRyailKRL/UHi4gg/MoallYoK
         TkMyYonKjNLNGlzB1GI1eV8OvfSTRrjo2n8YB/XMEyxRi6BfKdtv+59yyfR6uRia5WFY
         IyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761107657; x=1761712457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ppwCPMx8V2Sf6deae1nCYy7pnPOnc4IDjA11Y0/2goo=;
        b=PRFVOYPo/o/V8t/J8SsTdXX9Sbl8F3HBOAhqBtBPl3HMZWVdw9FEI3wIYPhnq4gnya
         hz1hMPPVtt3s3evWmB90Guwss5YY/WWbTLOxfjfPY3Zh1IQsTbtkWe4Ep+JZ2mjseeI1
         Xv/di4HdVG3FkhA45Equ5WVgVKAFxTtcyziejARgZD7i/pDc9IvJkNjYRDIMqdWHaUH/
         yRsxvo6gf4UX/EFPbdeYuY1pD8fNq/WIowB0PPbRVt2BaAhuY9iKkp2HoL4hon1XXm3a
         d3ogH4OO/yJQZheXrXLi6hlL5jHy8Tu9cGjSMwq7xnv/SmeNqM7mxlWEeFLfL5LttfLh
         WqMA==
X-Forwarded-Encrypted: i=1; AJvYcCWg+7k0qLS/lKPxAJELBZZ+sNHFUYl4alXodyFPsX1hsvZhZtokg2QKiUVJUjs6pu2PofsD3SQ5rA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yya6i2HVNzOMm4bW2xgfyzGGFsc859kP1n1yZ/aW0t7uJN1L/+G
	heyWMdxu3vQnpjqb3th9njdYhMg0tM48zCz0RpBpe7bEGFPuiwTnkAwT2q13pM1l3dQ=
X-Gm-Gg: ASbGncupATRiFJtKnZD/4MJAQuxbyUdeaiKjhhOtknmjkrPFQVqR6o18h0CLjFvF7B0
	hdJYU6nOKZUwvFs4uHDDoG1z0WxeKmfFXoFlnTR0wS5kBhjEFQdv1J0Vhq0YI5rTI1pW281Th7B
	gAD65/9cbhCIcYN3Y+7iCONIn2Pzxu0lk82KaTCHU3VwCMze3YcOwCZh69mOoG1dSOcFF1uckTu
	gLdSg8BOn2MMQ1h9c93LLcxSn9OQ88gqRdaq9EUa3tu2oMFK/uTRyIMRgJXQzki8+A8Zcqs/6l3
	MnEPcND8J+JbjB5UPW/pMcrM7ORX3pZ272AG+sK2xWPgPYzxraFr6gbzUgQ5Y/jI4BW28rzMUz/
	1qHR80+J718R4mE840VjQQwYWq14TNAZAJvc1Xzkk54vZ/6n+WRsw3zRAh2bVDqV8R5jvnVmu7S
	ERZQshFEKf/HYn
X-Google-Smtp-Source: AGHT+IGRbL8alcY98vwlpMmB68/E/fiZ8vvTYnBqywFldOw2mBZIi0C45CU+Ljv9QC55tUOEBjim+g==
X-Received: by 2002:a17:903:1d1:b0:290:2a14:2ed5 with SMTP id d9443c01a7336-290c9c89fd2mr213302675ad.4.1761107657244;
        Tue, 21 Oct 2025 21:34:17 -0700 (PDT)
Received: from [10.211.55.5] ([4.28.11.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fe4cdsm126257025ad.97.2025.10.21.21.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 21:34:16 -0700 (PDT)
Message-ID: <ba01b2a5-a04b-4a6a-9257-09f38f2ba5ef@riscstar.com>
Date: Tue, 21 Oct 2025 23:34:15 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] dt-bindings: spi: fsl-qspi: support SpacemiT K1
To: Conor Dooley <conor@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: han.xu@nxp.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dlan@gentoo.org, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-3-elder@riscstar.com>
 <20251020-blinked-primary-2b69cf37e9fe@spud>
 <b28d71c4-d632-4ee5-8c4b-270649fca882@riscstar.com>
 <710c36f2-3551-4738-a965-f1564416348c@sirena.org.uk>
 <20251020-florist-campus-a397bf94d129@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251020-florist-campus-a397bf94d129@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/25 1:39 PM, Conor Dooley wrote:
> On Mon, Oct 20, 2025 at 07:26:17PM +0100, Mark Brown wrote:
>> On Mon, Oct 20, 2025 at 01:06:46PM -0500, Alex Elder wrote:
>>> On 10/20/25 12:39 PM, Conor Dooley wrote:
>>
>>>>> +          - spacemit,k1-qspi
>>
>>>> Are the newly added resets mandatory for the spacemit platform?
>>
>>> This is interesting.  I never even tried it without specifying them.
>>
>>> I just tried it, and at least on my system QSPI functioned without
>>> defining these resets.  I will ask SpacemiT about this.  If they are
>>> not needed I will omit the first patch (which added optional resets),
>>> and won't use them.
>>
>> It might be safer to describe them, otherwise things are vulnerable to
>> issues like the bootloader not leaving things in a predictable state.
> 
> Yeah, if a linux driver requires that a bootloader set up a clock or
> de-assert a reset etc, then the binding should mark them required since,
> as you say, a bootloader change might do away with that de-assertion.
> Additionally, the stage doing that de-assertion etc could be U-Boot
> or barebox, which import devicetrees from Linux, so making sure that
> the resets are present has that benefit too.

OK, so the resets property (added in patch 1) will stay.  It will
be defined such that it is an optional property, and only when the
compatible string includes "spacemit,k1-qspi".

					-Alex
