Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B2C225408
	for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 13:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606932; cv=none; b=AZLmeVtXZ5pahL3S0h1xmHR3+F9btkICbzQI2x3CuF5E6ldMT+lOBhRgUUIr0SMOkxq1ZrnzuGF6ClcUgqe4k1DMnt7hNxPZUpyKBlb7QE7cVF4wXFF0QHFb2kLBbHWEsXSdgHJ+NeemF4lapwHMgsOQ5b+8JXAX05BGdBdjc/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606932; c=relaxed/simple;
	bh=7ljei3xi3U8OfQYlSxjCCViYlQqU96DBeVgUd1EakdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T3aVUycYm1O7pLGaWbIOMikstgHqUfXg8+s9jZsBZLPtHCVbpomFNVRVt/rPwEx75hJMNhXlEl7JTUSBsD77XAeNJKanESca2EMM+z0lghhdc6eYf9h6pC/vcOi4MVdWeOLtoYIpnaGg0QiZ+b/4RutRvfoZJ1kBYfd2l6xWl4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=T4F7wYUX; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="T4F7wYUX"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-662feac825eso174070eaf.3
        for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 05:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769606930; x=1770211730; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CR+ZvBkGA0rmoAszJtyMWrCYonp7pdFBqImvRwPUKjc=;
        b=T4F7wYUXHaJsWkMwG/Elm3VP1E3Fh77jegWVr7WUbuaiD1lRS4HG8jVH4hk2mO8qDE
         iFZa/7dcVvDSwO/wTYg8ZPEX7P517ducoCKBkL2M1iR2quZt+8hKe4EbmfUV+OPkY/Bl
         hIqfms8II91HfEZtOe8qjodU8YSdkDrWAx2cuunPKo/Hm4PKpjLZNNJ1abUTGD1DIgFL
         OhlmwfvbUDby9iEYeTG0ayYEqeYv13+zDOodLn8a7g4UPy39+zLU5w4m8wZUbLhlEMGC
         SRP/1X/8ih5mJp41sIro55ME1pY8C3TiXaMm1SCOnMQfWmP4777l/KSX9WM7AAGj/QZ5
         uXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769606930; x=1770211730;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CR+ZvBkGA0rmoAszJtyMWrCYonp7pdFBqImvRwPUKjc=;
        b=w+GKJx7DUBLZNG0rvJ9KyG/OigYfRTrEzBz5FqY/sCw6tDg2mtbohx385mVDPxlGz7
         YuJ2iSfVkXTwTpFZFGeKke4mJcuhg+QjS8fK0cKmAN65XtBZwKmuwpp3JX7FRHP6suCz
         S5BPTaQK98I1ZeZ7OLrGqjqJuXnrFCQT8x2x0ue0X/lvyOKQ1kHch8MDA/hEAxrIryMs
         u625xeV+sn1spOzIPXjFnnfvNhvAypF5WShzv++GXX7QiVnFRtN9PWa/eRtEgcUEYO1R
         O5HjhCs3R2E/5k4fT9XXsbbm2Jx+YQPFGA3oW4io13+StGkjnixGRYW5nxhXPI/eCpU8
         od9w==
X-Forwarded-Encrypted: i=1; AJvYcCUUTOvMpuJ0/E94Mp4Lh95jRvTUjnnBV6DmpmQoTg1uMgy6qmgRWTXFd/k5z+TgmWeF924DHdYqTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YygTIAjT85BuAu/bAIykoFJE/CRTyV2xSdMFwKMd3Ihn0DC5T3T
	COKqxSuTxTEl7mM4l3jl+Pkxo8ViPpEz6ZeZK/Pcthad/nk2GqqRBsKrLmCxUhy+gKI=
X-Gm-Gg: AZuq6aJqjDlOGGcKPcIdy8UxmAAIpUxvYqL92g7rO16q3EpfjBCliEXblysvci1SUCs
	LWAXXx3b352fVjYOsbeRM8cx/tI/lgly2pHxW7FJRfPFM2fxSUBffMGyCTvOvbp7fTcyUbISnYm
	2YZBhHRweL/1cdNHe45cKsPxI0+QhpzCh+FfwFqU9DS2lg6MpqvO7DY0x1HRYO2MVeCDzUPp1EM
	xSRAtvjO2En4KDJVTxKNfkqRQEsHIZWIbNnbiPXK4TYgs0FeAP/Pj7mQdi9BFvUqHvo3h1jpyE5
	CkO14K+zsnt/DomvChrzZVObwAjWxvDc1RG7N8uKR7sG6ioZU/HDC2rH494S5G+Z5fhzPoxBu3w
	4L/Zn0q0hS+rYs66+oZVW5s8MecOQgGvFvEGmiddKzU7jIal36BW2xkoaAzQqwjniEpgO8nORQh
	VI0kBgp1DMrjuI7lOgFG7ooZqJNOaJh61chChHb8BHNmrz1oc5Er8=
X-Received: by 2002:a05:6820:f061:b0:662:f493:181 with SMTP id 006d021491bc7-662f49306cbmr2051118eaf.76.1769606930064;
        Wed, 28 Jan 2026 05:28:50 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-662f994388fsm1374132eaf.4.2026.01.28.05.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 05:28:49 -0800 (PST)
Message-ID: <501849d1-2158-471a-af25-da3dbb070422@riscstar.com>
Date: Wed, 28 Jan 2026 07:28:48 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] regulator: spacemit-p1: Fix n_voltages for BUCK
 and LDO regulators
To: Guodong Xu <guodong@riscstar.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <20260124-spacemit-p1-v2-1-2c86b06694ba@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260124-spacemit-p1-v2-1-2c86b06694ba@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/23/26 6:20 PM, Guodong Xu wrote:
> Higher voltage settings were unusable due to incorrect n_voltages values
> causing registration failures. For example, setting aldo4 to 3.3V failed
> with -EINVAL because the required selector (123) exceeded the allowed
> range (n_voltages=117).
> 
> Fix by aligning n_voltages with the hardware register widths per the P1
> datasheet [1]:
> - BUCK: 255 (was 254), allows selectors 0-254, selector 255 is reserved
> - LDO: 128 (was 117), allows selectors 0-127, selectors 0-10 are for
>    suspend mode, valid operational range is 11-127
> 
> This enables the full voltage range supported by the hardware.
> 
> Fixes: 8b84d712ad84 ("regulator: spacemit: support SpacemiT P1 regulators")
> Link: https://developer.spacemit.com/documentation [1]
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: No change.
> ---
>   drivers/regulator/spacemit-p1.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
> index 2bf9137e12b1..2b585ba01a93 100644
> --- a/drivers/regulator/spacemit-p1.c
> +++ b/drivers/regulator/spacemit-p1.c
> @@ -87,13 +87,13 @@ static const struct linear_range p1_ldo_ranges[] = {
>   	}
>   
>   #define P1_BUCK_DESC(_n) \
> -	P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 254, p1_buck_ranges)
> +	P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 255, p1_buck_ranges)

This is correct.  There are 255 possible ranges, 0..254, and
255 is an illegal value.

I think this bug is an artifact of a change I made while
chasing an issue during development, and I neglected to
change it back.

Technically this is a bug fix but it doesn't matter because
this voltage value (255 represents 3.450 volts) was not
required.

>   #define P1_ALDO_DESC(_n) \
> -	P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 117, p1_ldo_ranges)
> +	P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)

I would say this is not correct.

The valid range of values in this register is 0xd-0x1f (11-127),
which is 117 values; 0xd represents 0.500V and 0x1f represents
3.400V.

Technically, all other values represent 0.5v (and could therefore
be considered valid), but I believe those should never be used
and intentionally considered them invalid.  If 0.5V is desired,
0xd should be used.

Do you disagree with this?
>   #define P1_DLDO_DESC(_n) \
> -	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 117, p1_ldo_ranges)
> +	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 128, p1_ldo_ranges)
>   
>   static const struct regulator_desc p1_regulator_desc[] = {
>   	P1_BUCK_DESC(1),
> 

I have exactly the same comment about this change to the
number of supported values.

					-Alex
