Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69F53346AE
	for <spacemit@lists.linux.dev>; Tue, 28 Oct 2025 20:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761684601; cv=none; b=Oj5reqJB9uCH5Qs2Hpb4TF8bURofDibU/OGEeQOCUnXLfIOVEtePh7dnT6qZU4mnWVUIOYSd7OPkBLO5XCznrKPDdsZgxO+V0oB2byV0xul5+xcY7AM9hg3zU0d5G6OTBeFsTz+e2hYGuuuH/t8hravKnLOoHWwlj123cU7/I8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761684601; c=relaxed/simple;
	bh=FKJWPmS5QgnY3R2AdTz5RMSJOELWW0vWKsMJbBFymPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kpZYk6Fi8pHSXkonTcytKf0HOLmCfOOknas9yz3f6h5qFS14/OpTuYM27DRcq3D/imA/bOGl/JLJWs1DI5FgeMwa+kY6ZKnA7zPCOrTOlG2zA8fVgUm3WLfN4eJ3TOB3pDFEArM37m9OaeAZyE8cbqdJt2lmMa+5Z2x+fsIz7Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0l8XgwFi; arc=none smtp.client-ip=209.85.166.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0l8XgwFi"
Received: by mail-il1-f193.google.com with SMTP id e9e14a558f8ab-430ae09ea23so26487365ab.0
        for <spacemit@lists.linux.dev>; Tue, 28 Oct 2025 13:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761684598; x=1762289398; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R6TldsVLxc7ZpZ3BCidhfMeu0Nkd2dELKLkuMBzPbjk=;
        b=0l8XgwFiF4LJLzgnWByJOv5MMSdgpsJiscYBiekUplqpZLidr3ilbtAiKz+/MlSCeH
         XJY5R5WxNjPZS5wdjwxebKfKGVPWM4mcg5qZIJKo/+gNYivpcUkwC2LH7lM1PP10+J+N
         GzWoKAJUxLnu+197Vt9HDuBqj/h1H27oEi4mttEjOyGHSOUjwjxkZzkmBbRDlmezdipW
         c+/gYZldQ8ajTTC3XJNgW5VB7D21JwY6C10DIqNb3qV4ToqM3MUFBB7lbt/YX6UbpBfC
         vH595Z2mHD5qDgbWvsDKGSveSuI2Fs+znmqRwQchziCVI8wCJYhG0f/oNg8ZBkp85ZYl
         gOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761684598; x=1762289398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R6TldsVLxc7ZpZ3BCidhfMeu0Nkd2dELKLkuMBzPbjk=;
        b=FD+1AVqdpRqvNrRurxGhJm7duVnmfvn6fRUhNyuayrRvGDog4FfL/Tn6F2hEhi21ED
         sJPsGYjLTwOZRN29WOcQNi0vLPXP17Hv2FzLbOjNgEZoVCoG1ln80EYKi13peAgpee+F
         WQWeYjoZsp9p0j09v1Vq8mY4mCg3sZH89FVtMvsW3ROOagnkAmI4VG72nBZZkkFp8pz6
         oFb1Xtro+R/pH1SwgBXXe+n+Wz+ffNADQsh/Woq8rUFJjoGJazMv9b9ah70sJprJ6kg1
         WEwhhRYsvNNjqvMYIQNaEW1rs21Ir60iaI3KoLzMPJlvOL6laM+d6bzmHcyntCbuNwsM
         48iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGMMsWELRKoWWzQoGwmfNujrLI4RGWqAQp4BGINA6eIbvAjNJnBUA1dzL+jB1f55x3432dVChp2g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4nmPJ2Z2LaJi1rBtzjlG8X3yiGCpUGzTmSCYiJiKNqGYe9I8G
	IJelSNDCCxAKDJYoDtRbZOIuF3ojXCa8NEYAWMVAwdAsnaUCStALb+5rs/RaBGpDjsM=
X-Gm-Gg: ASbGnct2xak13eP6Rchd3D2Pv+mHnlY7SaHciwyqhdPsY+B8GBs/1CWvLtGg6n4L3ij
	fugCNT4mqJDsHEpvvxwa1/vPnTcLi2cOlnNFrlFn47JqaI3ZrI8hksA2IXKGTl6rEHLoEAWCd9v
	OHKJcr7q5Cj610+M8K6lK9odEAnrSF0RDoPt2t+pDMx7GNzF22eFlFIE8pRVekJCu65m+bu0Vqv
	uwh1dPJRh18kavJghAMag//kTVvCsoL8EObC7MYRllrSmuQl712opL045Nc6yofqat6AmPWGqkQ
	/KQ9CLKqmM88MtNKV+gl1KXn4pFaFXJUrSu+EvmKTbkF3/AtlVQBnRrAjvwy9LrjhVXKNBekZ6B
	jXW92dsy3WwMDD55nqfl8yyj52CBKIDuJxyso+b8JEAxU6ddi8zPjzYzMsYAF9658kMEdwcCy4x
	hvUZfHWldxMLosXRQBI/CajsppaYdRE+9baDRrOeC6
X-Google-Smtp-Source: AGHT+IEqrqUPdxyh6nYJQcfD3zvrLobFkCBCdnIEdI/83k2YFCmj2OXCJVPDfmu5Z5HhIeTYWdj2MQ==
X-Received: by 2002:a05:6e02:154a:b0:42f:9399:ce93 with SMTP id e9e14a558f8ab-432f9028b73mr8923535ab.20.1761684597966;
        Tue, 28 Oct 2025 13:49:57 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-431f67eb4b3sm47212635ab.12.2025.10.28.13.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 13:49:57 -0700 (PDT)
Message-ID: <a836c200-e079-424c-9fad-600f802e5220@riscstar.com>
Date: Tue, 28 Oct 2025 15:49:54 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Introduce SpacemiT K1 PCIe phy and host controller
To: Johannes Erdfelt <johannes@erdfelt.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 christian.bruel@foss.st.com, shradha.t@samsung.com,
 krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 namcao@linutronix.de, thippeswamy.havalige@amd.com, inochiama@gmail.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013153526.2276556-1-elder@riscstar.com>
 <aPEhvFD8TzVtqE2n@aurel32.net>
 <92ee253f-bf6a-481a-acc2-daf26d268395@riscstar.com>
 <aQEElhSCRNqaPf8m@aurel32.net> <20251028184250.GM15521@sventech.com>
 <82848c80-15e0-4c0e-a3f6-821a7f4778a5@riscstar.com>
 <20251028204832.GN15521@sventech.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251028204832.GN15521@sventech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/25 3:48 PM, Johannes Erdfelt wrote:
> On Tue, Oct 28, 2025, Alex Elder <elder@riscstar.com> wrote:
>> On 10/28/25 1:42 PM, Johannes Erdfelt wrote:
>>> I have been testing this patchset recently as well, but on an Orange Pi
>>> RV2 board instead (and an extra RV2 specific patch to enable power to
>>> the M.2 slot).
>>>
>>> I ran into the same symptoms you had ("QID 0 timeout" after about 60
>>> seconds). However, I'm using an Intel 600p. I can confirm my NVME drive
>>> seems to work fine with the "pcie_aspm=off" workaround as well.
>>
>> I don't see this problem, and haven't tried to reproduce it yet.
>>
>> Mani told me I needed to add these lines to ensure the "runtime
>> PM hierarchy of PCIe chain" won't be "broken":
>>
>> 	pm_runtime_set_active()
>> 	pm_runtime_no_callbacks()
>> 	devm_pm_runtime_enable()
>>
>> Just out of curiosity, could you try with those lines added
>> just before these assignments in k1_pcie_probe()?
>>
>> 	k1->pci.dev = dev;
>> 	k1->pci.ops = &k1_pcie_ops;
>> 	dw_pcie_cap_set(&k1->pci, REQ_RES);
>>
>> I doubt it will fix what you're seeing, but at the moment I'm
>> working on something else.
> 
> Unfortunately there is no difference with the runtime PM hierarchy
> additions.
> 
> JE

Thank you very much for testing.  I'll try to learn more
about this in the next day or so and will resolve it if
possible before I send the next version of this code.

					-Alex
