Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294011D47B4
	for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 02:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761273124; cv=none; b=tV0Q/RIej+XUmqefcfu/Tclx9RziPAqDIUPKgSyr3YlNJ4wxm+d3vdb5Z1KLX6+enVOsbkrYtlGtuBR8X22UByD5DiW+WhUSKjOd79rdUrp7NCvwiXwjGwuD/fDVBipe7buQHk78aUthQbAdkumZiDQ2AhILmrWIn6hL5Svklks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761273124; c=relaxed/simple;
	bh=55IQUxzDMcQ4mCOoGJfMg/Ei4ih5BPWUSJBpAl+kkgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MwY10auEf0mcQETytbII8UscJM0VgJzzjjnO1TXSEp73g2mVcFVzI9cbNcqnvxzKDIXzxacqxkaBNhIfBY2ZdzCXmuuhzVAFIdDuP/lUG/99UdqJoGu61cz48e3leeMD6zj2QffpwhQ2TeE46U96/NSxBlnJU3JU79wsh/25UII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=V78dIAOG; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="V78dIAOG"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-27ee41e0798so20641345ad.1
        for <spacemit@lists.linux.dev>; Thu, 23 Oct 2025 19:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761273121; x=1761877921; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kzKUpWrMzxlp8IP1Hn+gGsM8P9oC4CEs0ABcpzIqxFU=;
        b=V78dIAOGBgz/0pSd4oOyhzZ1Vorv+5REnkOfubNjkbap4B0p6etbWV4AgXeSBfFO/c
         iCG25N0Hx6+npjwJoL33h8LANVhVqbriAbHBaj+3EPtGoXRWLEYSSuSLXMIAKK/7jpok
         m5iHjimI5N5MG0Qzq+WwY9/aX8ifNNGd8UauZl8FFnq7+jNaySaIEIwX8hdcFhy03amu
         nbK/Swoib2Fx2xrhBJrm46bIupq+2FNXXtUsAGXm1iRMzWHAlb7+Ggr2ig65vrgXfT7U
         m81JPwCP/6n1/h5AYKsPSzPanctGzpxEOKX2vBJd1TsjvEUbPkEK29x+fsoEm3+SMP1L
         WlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761273121; x=1761877921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kzKUpWrMzxlp8IP1Hn+gGsM8P9oC4CEs0ABcpzIqxFU=;
        b=sazwSrqGOWygtOEVOkhQU5VWoXyCy4hekny3y1OuUeSsuWCmi91uLGCYDrIno8mMsk
         /Xn/ExPIyRGIRB44RmVccxVT+5sVQ6dBSzVFvVyAMFqRh23YeooFBaaMZyE0CUKS2SS3
         0RGrr8xhCWDhisFtyKlmQ3SknVGYnC+3rnKPLrdHSzeifIZhmVQQ4Bk5Spc3dbG83Ko7
         TfSJFe8lWuYFZv/DW63o6RJN6AJZcz+1X5zB8ptNV6ql2j7H5sHGlIGjrVXV3tpQQrRR
         TW18x5a5Uao/1rrScj5NZLOHDfk2vNF35rtFSLjvoRWwummL7UbOq2P3UMjSxTKzR52f
         bIGw==
X-Forwarded-Encrypted: i=1; AJvYcCUD3RL8Vok2qQUnRhr3I3VQV0/3IY266rQUMWpD8vLAK6+JMMtLjlOJFgvcbFdhqquZFcADrSwBGA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPNVs4bnNL7F+mo3NhvD3FN386zQiFDUEX/PylRMc6D26r4/am
	/D9SNByzhVWH/bY9Rj9xujYwv7V1+NGslQdEbLyztQAfxU/sMkVcHYipDCS3J/BHMDw=
X-Gm-Gg: ASbGncsjsp1tCPVfDdYI3ZeHPA9o9YQCJNOhaliGKg3cnWkp2w99ChjidvKflQxEOgi
	1bIW4xgiH0Ft1AyvQTX+HZ5lXUCu4RHY3BZDc+RgBKkvqUoWaZwCW1By2sX72TC5rxbw62XOQBc
	rSnhgMgtFLWWSoJ7QkwANzZp5TKBjez9Fbb7drbXhqf+w3UdfkB8TUqh3MB3sTqw3zBlBT29ryh
	icjFq4iz2omAkzsyuwe0tcujovbEHOZJ+6iLdVAR2+cUh/o6ReG8e8edZTquYNA3luOgBhOUj5C
	H3VPaoPHQ4k5SoJ1aHAQL4V/CQGI+Se5CTLKyqeU8qqF499ou1aUvhG2sYnoTnSL+zrclrzv/wz
	3/p+AgqthubzEe3iSpsgtI/c24KbjaXDcGQtH2zteh2w6vNLJA2A1GX4qOympu0YPzyjqMdHvFT
	jlSMMMQ/hCmIaA/K0=
X-Google-Smtp-Source: AGHT+IHA/K4QUyGTpQDn9ihnxw3kPWzudC8RYPggiHagQ4ZXS400Tm4j9rYxGD5oYzwHu+DSEJUE6A==
X-Received: by 2002:a17:902:cec6:b0:290:ad27:c1fc with SMTP id d9443c01a7336-2948ba7ccdfmr7272505ad.55.1761273121331;
        Thu, 23 Oct 2025 19:32:01 -0700 (PDT)
Received: from [10.211.55.5] ([156.39.10.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e0ef2fbsm39193715ad.79.2025.10.23.19.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 19:32:01 -0700 (PDT)
Message-ID: <ab1fae69-cf2f-4417-9f19-6383c648e4d7@riscstar.com>
Date: Thu, 23 Oct 2025 21:31:59 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] spi: fsl-qspi: add a clock disable quirk
To: Frank Li <Frank.li@nxp.com>
Cc: han.xu@nxp.com, broonie@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251023175922.528868-1-elder@riscstar.com>
 <20251023175922.528868-6-elder@riscstar.com>
 <aPq75FBuYvFQrbQE@lizhi-Precision-Tower-5810>
 <a43b6ddf-c552-4db8-89cc-49951015161d@riscstar.com>
 <aPrfSVEP5xasMEBr@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPrfSVEP5xasMEBr@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/25 9:07 PM, Frank Li wrote:
>>>> +static inline bool needs_clk_disable(struct fsl_qspi *q)
>>> needs_skip_clk_disable()
>> OK.  I was trying to avoid the double-negative:
>>
>>      if (!needs_skip_clk_disasble())
>> 	clk_disable...()
> Oh, Make senso, needs_clk_disable() is fine

I will leave it as it was:  needs_clk_disable().  Thanks.	-Alex

> Frank
> 
>> But I'll do as you suggest.


