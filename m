Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE460221FD3
	for <spacemit@lists.linux.dev>; Thu,  8 May 2025 11:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746704410; cv=none; b=lv+MCFpRnvcLgDmkzlrNqkGd/uV018SVoSsKFTQ9RTUUs30TToqEdUIjFJ+f/DA8zD6mLUieXtj3qCjZUYf4w79RAnQfOa4vXSkHIDf/26229kRgXhdw4VHvsNKOKo/2xI4cHnWrmOnvLZwkM0TggDGFRZ9PaE5PvjV7bGdAtXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746704410; c=relaxed/simple;
	bh=Fx9zrUTk3i8S1DAJFlFt9wfUwkt0xKS/Y7jdzQ/hcQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eog93/3QUcEtzPsd2C/zlnWfxEUti0boV3FTCEEVKIKstE5hnc8RfwQaarpVD4jf3AnmEBPyV1sxM4CgjMj0tu4pxGjXXif2seV10Z1dYhFUN4eWUj7hpXbuzsNn6cju+X0R094XReaFZ0lDS2lskFlQiaeCmwS8Ed7EXIzVpAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=FabSMLzh; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="FabSMLzh"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3d8e9f26b96so7547285ab.1
        for <spacemit@lists.linux.dev>; Thu, 08 May 2025 04:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746704407; x=1747309207; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7gCgDIEvIXJ5HjkEoan0OBOu/905mhsNatvjj6Ubkh0=;
        b=FabSMLzhTUikPi96tjqNTwynpsLNYvDCLbCcy7HQMTHD98UGoPZdjQ3jOssngcwnEh
         E1igU5S01jJbZN3W6MPGLtKePXO5UIXB1lwqZlB3avQjAj3mtjMOB62laXrYJ3PFIEDH
         +gANcbez1zc3+lNAHEZ9bF6Vwb6ksWPWGE61DpgeicRvRtnUyIKUS9GgJPdvy3kEfWXg
         2TOtuYEkOIlcja/cizjB7FlE3FuKSTHdo3qnTz4qahj4+nsjHI6MJDE+s6hnu6TC/+kr
         n1yGB8hCCGpmhlXb3a3rBU8D1AslUPJkphE1TRc1l7qpeu9qBeRtkcZ+ZmTca17GdACb
         kaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704407; x=1747309207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7gCgDIEvIXJ5HjkEoan0OBOu/905mhsNatvjj6Ubkh0=;
        b=CyCVmE5xIZSB8ZNF5l8XvxSSyJwY+EuxjGj3dLHYLUZYac6CYNHaprBs/FYlZLJKdC
         TkS6iC/q/LHa0cT0siyKx06KHA1ZapsHG/QLfUYm3OATvPNRCMOuaqfYZ3wLftyfDrSP
         hdcaQQ/9opwjZHq6sRMM9HAX+HOS6jrtsOySN2APSrlAnrabbu8KtoSUe7Q9E81fFxiB
         dWGPaOrTdnZTkSVp3zEy/87RiGaxpI20/sX8rz5dXqmxXnWlGaSn/zh3ZUW75dN8Ud+o
         gzpW3Z8cc2ScmGDqyoOX0neE1dqkIASXc5SzTTC0U05XsYrSeiJP0UtAdsSBYtchXrKI
         XNUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1V4nJsv4M1fbMVDnbAnXhAjm2lqAv72FKqRk6I/Ktf6eJH4yABk28kDD0DFqSG6SWNG7L3cVSmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YziNisyc9xVAARhBlv02Gu12BGHgzMiAvOEqdBF4pn1ofBUvxmj
	Z5f20Pk+fElm9G08d8x2i9PKGfDIg31bfXD8Wg2vk0goChDH5DtBqvLCiJhx69Q=
X-Gm-Gg: ASbGncvfpxzEtA0WluHiyacJjlr74NBMmMbaO2R8jGWYVvJKoDyYtVFsQOgE4eWeQt9
	ON+ggwpeBPgdk9B/w4VF6xho3acZUhWW2XETHsTJ/OA/n6kbEMeRdvEUrFVuxrmpIDMgeIdRbgt
	Hhygm5g0IiPZ+6X4f9Un3NXurHz8bTDQncbIUZSlmUwdLsiGbigYl/eNf9KB40svbQMTmyemaIx
	S/Vq2oOoJctZRSdBhaOHXPSJuBjbJsojRqdks+HTwjXt0Z2fYuWN9x4Mh7F61OHIBlgn+2f8cj9
	+Ozd+cslFgtEj5PELKaN9ng+ijUCZcNVMdypvt7ETqv1p/4n5ofeDRLqOpvJw5Oc+I1Ou9p77hr
	Kqvio
X-Google-Smtp-Source: AGHT+IEgQbpeES+TFJhbzId8HdAIkJfo3yOl1pgxcIDfMs+gyDWkgbwTLja1UcaM/Qo0ZByBfH3ZrA==
X-Received: by 2002:a05:6e02:3805:b0:3a7:88f2:cfa9 with SMTP id e9e14a558f8ab-3da7390856dmr72096535ab.11.1746704406737;
        Thu, 08 May 2025 04:40:06 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa8e1f7sm3145496173.121.2025.05.08.04.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 04:40:06 -0700 (PDT)
Message-ID: <d6649f6f-574d-4ba6-8db7-d3087f421386@riscstar.com>
Date: Thu, 8 May 2025 06:40:04 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] soc: spacemit: create a header for clock/reset
 registers
To: Haylen Chu <heylenay@4d2.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org
Cc: inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-3-elder@riscstar.com> <aBwwBSfnkw6XUOLA@ketchup>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aBwwBSfnkw6XUOLA@ketchup>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/25 11:16 PM, Haylen Chu wrote:
> On Tue, May 06, 2025 at 04:06:33PM -0500, Alex Elder wrote:
>> Move the definitions of register offsets and fields used by the SpacemiT
>> K1 SoC CCUs into a separate header file, so that they can be shared by
>> the reset driver that will be found under drivers/reset.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 111 +--------------------------------
>>   include/soc/spacemit/ccu_k1.h | 113 ++++++++++++++++++++++++++++++++++
> 
> CCU is abbreviated from "clock controller unit" thus the filename seems
> a little strange to me. Will k1-syscon.h be a better name? We could put
> all syscon registers together when introducing the power-domain driver
> later, which could provide an overall view of register layout.

I'm OK with making that change.

To me the "CCU" was the that IP block that offered clock and
reset controls (and maybe a few other things?).  But renaming
it, given we're separating the functionality more clearly,
is pretty reasonable.

Thanks.

					-Alex

>>   2 files changed, 114 insertions(+), 110 deletions(-)
>>   create mode 100644 include/soc/spacemit/ccu_k1.h
> 
> Best regards,
> Haylen Chu

