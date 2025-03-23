Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026802AEF1
	for <spacemit@lists.linux.dev>; Sun, 23 Mar 2025 22:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769035; cv=none; b=QJ+fWuu4KB4S955cFlDRZwxyEeo1UtlK0hv/68Ez6lCuq3JsQUON2lqMnU7TADcsHbnQQLCutCEfDkwgLu43gcROQ+Ldcs+lvAT522dTaEevY7QU/HUCWCUjmoftHK5jMNnVdz1xfhTaVqF3G97anx1PQBAkbDeA1a8jL7IP4VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769035; c=relaxed/simple;
	bh=1b3NqGhZ++VNtWquMWADqKAovnA8dxvjiZY17polxNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJQLpIunJNnr7GW83120u0i86vCl98GNRo1CF8EPdH42dHsRg6z+7lLq4FYiVmBlhr4NxYGFed4lpVQBAyBn+IFuRolERq6IZpQsqQJy8p1K+bAR2dgI2LXmcp4wXo2Jf2ijBGOalu3MmFhllpZChTzqehpS8cE8jnAoJZVXjT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=jGIBtniX; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="jGIBtniX"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d46ef71b6cso33628645ab.3
        for <spacemit@lists.linux.dev>; Sun, 23 Mar 2025 15:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742769033; x=1743373833; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nTRlExMDyawWBV8YJuZYM4CxYbcHVqfU+45dmVV3tsQ=;
        b=jGIBtniXC3vZfRhPqQP+dUvYwYeD2Sk4Q3Sa6AY7GlLa2jtUmkNPfzf+0tvxA7vOsZ
         hNsqWfLAbyE4CcHa3Q4QXxbcatsJSLYeQJa7RwJgxE/kPiNX1GAY8lhJDJEd1p5OnuKs
         pp1a9DFQGOutf7Hu4uzaKYw08cI3WHvl7a5WFXRIz5NvE01eWlhYhd9Vu8A8pi/xeVvI
         i7R22e+hfTP5XXCNEbnXN18kTBdLRGMdrzVo5BB/iN95UW/C+amlkwTMciVKV6gEqlmW
         mXRce+xDnIcPXRgJWo999bYPAmDvgA0T9IjdBla1VDUXycn5Vf0Z2Lcjdo/4fJeeR6m7
         fp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769033; x=1743373833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nTRlExMDyawWBV8YJuZYM4CxYbcHVqfU+45dmVV3tsQ=;
        b=wKagEmjXGtrnJWlcP2iXHRqbn7rgw6YPcTF26wAB99/SgqdWfwTRD0VMRtHb1GKPu+
         HCYP686mQZUdC9MU7NfzfggdTDUXqOXwR78ubSPWhnAQzfvstDA9IjUKX1qAlK9pn/vf
         6Sgxz1NGmEs17brikbJTJuh1Jgxq3kshyb+TDRupvdLI1t21n0np6DtvYP9OAtQz+ZlX
         Onksnkij0R0ih3oLZeWUE3f6VK9WlTjRhcYSQDHxKLwPUbhatBmfRqsbdx/HgWJJeERR
         5cKybMTbUdWuw4nV3oqUGeFbyM5YuX7gFBH2mdg/ks0kztyQRdqqkHO7fCoKJ59KadHw
         uAAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWExnjAwezDh/5bFxC1SvQdAHu7g0PbjbDL6ZOWHT+sxXPdva06BMGAcqMZQP+mP0laEp6naVnxqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYO+iSzPVQUaSEI+IHrzKiOn8Tit1rYSIkr8nPT7LEPHA5VoBG
	/xa2spnmJA8OjzSnDJOqvwLad5d/0xqRjqlSC/FVpQz5sO7EWpMDN+PRhoGm98E=
X-Gm-Gg: ASbGncvSC1aqUlSHr9kI8PznbEq55TXa/0FlIVorshkmAa/1BnQmes64PU8R4W6wiE4
	1sKzVO2I9nnstfwqqfYhAcYISnmHYDm1pvhF6gnfdxmCqTmIiDVfQqqqh5nMJgxrnGbIULZIs1L
	8kvrmiE+ideCLPZwxu4DxxtyhbH/ClJzWJTQnO3zdKoy0jF9J2vcoBPlXsmOhRG2kYau+cjR8r0
	QCDsLceOQay+ouRGZzqKA9GEh6yJE3foR7TbqT+Ld62nFXAFsqVIxwSKClhJfZFtE4fF7fDoN+Z
	7/IT814HIcJsxNElfdo0QKEq5vx6cDJKGSBMWB4WlGcYUBTy5LXwUaVexio+jYCZafvWwoMs3XN
	mACu7PxLjRnhQvPp3bg==
X-Google-Smtp-Source: AGHT+IGH7axJe7eTCwDAhgnxz/2TT8RhnJt+UseNxV/R3diYZCOSlRPsij/3sX+uVBgUHGoEXTkhpw==
X-Received: by 2002:a05:6e02:3e03:b0:3d0:239a:c46a with SMTP id e9e14a558f8ab-3d596114994mr121950535ab.9.1742769032889;
        Sun, 23 Mar 2025 15:30:32 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f2cbeb52f9sm1538014173.130.2025.03.23.15.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Mar 2025 15:30:32 -0700 (PDT)
Message-ID: <661457f2-aad9-4b3c-926a-6ee021355dac@riscstar.com>
Date: Sun, 23 Mar 2025 17:30:30 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/7] clk: spacemit: define struct k1_ccu_data
To: Yixun Lan <dlan@gentoo.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heylenay@4d2.org,
 guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-3-elder@riscstar.com> <20250322155034-GYB11633@gentoo>
 <45526855-17b2-4de4-8e12-6320b7d84c8e@riscstar.com>
 <20250323130430-GYB15267@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250323130430-GYB15267@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/23/25 8:04 AM, Yixun Lan wrote:
> On 07:43 Sun 23 Mar     , Alex Elder wrote:
>> On 3/22/25 10:50 AM, Yixun Lan wrote:
>>> Hi Alex:
>>>
>>> this patch change relate to clock only, so how about let's fold
>>> it into clk patches (which now has not been merged), so we make
>>> the code right at first place? cause some moving around and renaming
>>
>> No I don't want to do that.
>>
>> The clock patches are Haylen's and the are getting closer to
>> acceptance.  Let's not confuse things by adding a bunch of new
>> functionality.  Get those patches in, and mine can follow not
>> too long after that.
>>
> 
> I only mean patch [2/7], not all patches, as it's still clock related
> but, either way fine by me if you insist

I see.  It would be great for Haylen to implement this, it's a
better way to do it anyway--you can define the number of
elements in the array using ARRAY_SIZE() this way also (rather
than having to count them at runtime).

Haylen is welcome to use my patch as the basis of this, but
if it doesn't get into that code I'll add it.

					-Alex

> 

