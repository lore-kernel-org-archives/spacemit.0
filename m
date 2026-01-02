Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3752F2D8DB9
	for <spacemit@lists.linux.dev>; Fri,  2 Jan 2026 13:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767360594; cv=none; b=MFf3/bEc1uQjPsiak90HqBqjl2uK5WRTobzoQMY+zr4s4xI8aIlp2eN79eMVYrFWnZZFxWNYf7dDwu3mT+3ZeUsB0Hq5aCeKPuTKWBT4y7XZeEVgf26WNa7EFGaFOFGAwdh5nb+dcwfAN7DkSw9wBZZ5FvfnpFzY/L4p4+8Xank=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767360594; c=relaxed/simple;
	bh=nbm9P1ws94nNvSuGkZG33czcziePv/A0XDV0BxeQvqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SfMmtilsCW01V+JAyZY8twcRLLBp6BeXYtHqY2Hv90/Inl7yU0o5wYLx9rsITlf1GyUCXvXmZTagcKXvuDyMUvnii+6d37gaf7+QQoeLt6HogSriQ5Fk9vqSPi06O8ViW/iNY4W+vwlCFTU2hV5+FyO4GBANJjnfImVAH+W5HaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=rZo5w0HJ; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="rZo5w0HJ"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b29ff9d18cso1421597485a.3
        for <spacemit@lists.linux.dev>; Fri, 02 Jan 2026 05:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767360591; x=1767965391; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hnJ6jwDgQJU9BTuZLL/HOYsIa/pNPxkZejWHZ4P59ag=;
        b=rZo5w0HJAvpExwXAzNe3HDHrDey7KrgwCavSk3PiZN3lP6q8TaRsHjM4rAb7iMXcgf
         MU5vpxUkDjhb7Je7cLqWEec3QiVB7Y7G0eIiQ/WzNs7IzJPDG6snV2tgr5I4f5v1jGCL
         +Y34qjPOTR3FtbA8q89c+NDlzANbcTXS/ZUG6FO/JAUQXZLkAGAQf8VqELJ87THNw3il
         Xua/QePVP4db5SM8HhqCBopQDB1nw01PENyrEzvaYS/DaNI7kA4gLOVySO5dP5ekz/88
         /Rh+9KgQS2YzSfjjnM3hwvycqGCMTlwfN1owUQ2zSf0AeDQzjeBkB+ng7buQvWBIaXwO
         /yvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767360591; x=1767965391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnJ6jwDgQJU9BTuZLL/HOYsIa/pNPxkZejWHZ4P59ag=;
        b=Irr21QLkJsDM+6bGnhP2Fjn9yBk138fMwatYkXhIJO91JQXyx0P0qlIC6x1HPM1sNs
         F+kCp3g0qxboAZZPY4xvn1bx9fYyXzVQlabk81nR7XKOGmTvl+i14BgLr7iy47m6p52J
         8ZBu+ZVxN24Ap6Zkt4RKi5qOZcQiyuygK6E/If6Z4J6mQwblTI0xih2Vq0OYSFdQ8gKb
         rPVBMoUNuoERGVDre4gLk0eGnYIc9Q4DMZbZ3rotYokZHtxovTJMctN9y9Wz9DVLrA0s
         I4EZ2UPM83Ik6rGBFPNtyY4trK6VyKK62tg6hJ3kXVMBMnAfOZml9NDnn9TmIsKfdDko
         kioQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1WArsTuV/TmqNdRxyAZ0J2m0w8WwxMUbQrCcrtoNEM4l4ALOSYEvQENJkANBAJJFC67ZTu/as4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKJY8ry06Tct0nJWEDeTSu1wew5NAgBqsUefkk85KpzNrMrvl4
	Vr+IQZDVlDcEoEebzJFfizeeGt9CS7Lqd5AjrOrM0KwizXMXChlM/VuiAemR7iDgMXU=
X-Gm-Gg: AY/fxX6u6RqA1n/KpySyCQ9rRFhOCWkM5m6E4DX7xNSraah4dXr7HIUsuOWwArScnCz
	RXlR/97hVeLHIlpduQpqODipQtY4WOl35QX8NBtmPHhI2D697ZLrsN/HZJ5T30/4Tk6JlDh0q44
	GFALlXzYD6g1ojfdaUw8LMn59VZf5Udh6l6Wg4M+btsBjQKLow6DHJQIJlS3ReRJhtrrV+pz0oO
	QSHmIaXHfUEXAl7F5GQH35Dp6ll4w3IlJetFxRu5puniXHFrXdXLdHHA5sUsRQLwX+clH5iAi4c
	t7dl8HLxoNhPFaJb9ctw48brVQBFWqigzJVX8itMeaeS+fpcWyUnlxYjVSQZJEwHLFunJl6ouRR
	O96w+G8CC5Q5iOemoVPHvOUvIzdwZ579DDCGoKOPqsZKenkgyJZKYnmR9d/xABYpQb1sGJ+3nt6
	VdmHgldw+D8pvNIrjj41jGdrug/1b5/B3hXjn6KymG4cOqEkkb8So=
X-Google-Smtp-Source: AGHT+IG1Ojp/3ZHOCk+pYw0wTrXWi5TRpNf/s4EXvBvr0lH6ldzNvpRwCYYQWryLM3d/lhoyvZPU1Q==
X-Received: by 2002:a05:620a:460c:b0:89f:764b:a4aa with SMTP id af79cd13be357-8c08fc0023fmr6594472585a.18.1767360590946;
        Fri, 02 Jan 2026 05:29:50 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973ef6bbsm3205417085a.43.2026.01.02.05.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 05:29:50 -0800 (PST)
Message-ID: <fa2d6ac9-a919-4ee6-a470-16f4727a631c@riscstar.com>
Date: Fri, 2 Jan 2026 07:29:48 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: Kconfig: spacemit: add COMMON_CLK dependency
To: Vinod Koul <vkoul@kernel.org>, neil.armstrong@linaro.org
Cc: dlan@gentoo.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, guodong@riscstar.com,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20251226173228.2020411-1-elder@riscstar.com>
 <176726567931.201416.8144273654305302884.b4-ty@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <176726567931.201416.8144273654305302884.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/1/26 5:07 AM, Vinod Koul wrote:
> 
> On Fri, 26 Dec 2025 11:32:27 -0600, Alex Elder wrote:
>> The SpacemiT PCIe PHY driver depends on the common clock framework.
>> Not specifying that led to a failure when doing a COMPILE_TEST build
>> for the SPARC architecture.
>>
>>
> 
> Applied, thanks!
> 
> [1/1] phy: Kconfig: spacemit: add COMMON_CLK dependency
>        commit: 8df20813eb01fe29b4507fd470d73675bda3e1dd
> 
> Best regards,

Thank you.  It looks like the same problem affects the s390
build as well.

  
https://lore.kernel.org/oe-kbuild-all/202601022046.OKfcBo0x-lkp@intel.com/

I have confirmed that this fix wasn't applied, and with this
fix applied the s390 build error no longer occurs.

					-Alex
