Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD791E98E3
	for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 17:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767030670; cv=none; b=fXJ4fnPJuLlPVHeAOV3psaUwZwLmHovGX1xEQGsGIqUX1WO7K+0uYvkAW/bMFdhl0qX/WjPQ3kXpSBZxRU+N1GeWQxKTdbh4Q8wEMsf0KhFaRz/fZE1pX9/EVwJzCEaVEGtRAfaT8XbBeKlqTt2fedzx75zJEm3+bJv0LtbIbWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767030670; c=relaxed/simple;
	bh=1XKEYe/CZfMjAILCm6Rc6akSzewyZWwV/1d1uiX5tVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WdMD+ZmHPfqBdr18+kuRtLispoLEcN+08TmogpFGzWwZjtANlh4RC/drK+JpEnnst9vKJxli1LzzP5BvQsBpN1Grvh/EFEw9UfLwWlIQCWHFH9yJi5KNAJSEpSWhanuNdw1aWSAnumsXSOasNaMo5QKx4pI1yDKtt5VVeJ/LaBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=NuOUeS4H; arc=none smtp.client-ip=209.85.160.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="NuOUeS4H"
Received: by mail-qt1-f195.google.com with SMTP id d75a77b69052e-4f8a6b37b2dso15205231cf.0
        for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 09:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767030666; x=1767635466; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qBVKZpfddpe+Ns0g7Sdt2AUT7i0mQvsGFZpu3wnG5ic=;
        b=NuOUeS4HjlwOXLCxqdk8fysFoFE7NjW/K1+IVSjCCNARhcAk8FVEkUmPwcJA6wAbSv
         qqRyvry9PwkImF6EsNsQ26GcgoMjKDYcMfbjE3Z8DCl/1B0VxIpkzdN8oVVgyuIigipX
         mLU3MzLDeDxOk2Kj+P2FLUTfwxHPlxTCMYjVfQHSgNvwU5TrCZEher2BVRJQ6ZwXiO0V
         fPZTsFLoN1CMuUZ52Bz5H+exT9eFPv6j4189fD9u6kL62ZVtZ1xXCAXtyuTu3VItPfK1
         9hW5k+guX7vBC5ny2P5yIsD2IkvjFPSJa6iqfoOu6YZPDlyZ68ZRytMfIWS1eEa9cVyV
         RQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767030666; x=1767635466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBVKZpfddpe+Ns0g7Sdt2AUT7i0mQvsGFZpu3wnG5ic=;
        b=Jh+cBWgklV4ZFltTVdHxr3WO3ttYnmW0fG5ewNX7KfU56M+nIfC7JXefBluYejUKGN
         V+2oeBwKP9wPlPxaEBz+mDfZL3DeNwZhbco9HM410NwQGzy+9gjJsu/sN3bOK8azs0to
         GB2HcTe6xx85cwaQWQ1g+/j6STZ+I9kVecNdhTihrUby5hz1sa3qyRjin/2sMa9ICxpY
         4BOa307mvuxPyac3E2xv1r2qPqug3GDD/4dFjEX430VC82zJnh3ydHTzt8UqV11hzBZY
         i+jmICevoJthBXIkaQ4C1ne61yo13/mnmIjqaAYYaNMhvxnEw6gzVofw6lBrqEGQoSts
         FIoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNgyvtaTbzyfvRAjvsm/k26KMagvdtTTtAX+R922jGa9QBFZboWJ38fdS3RhfyL2Ctd6LK4xczvg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLW2GgX7jN+0cTDy6XlMYmL1dAoo+4c3XMOoZAipD9ILdOhuJX
	nJOCj+NmJD6A8EphR65P2lQqNep2GScS6pXDXTHuwF7Gp6jhbtyOQrisB27hcy9IcIE=
X-Gm-Gg: AY/fxX6rxR4WMy0gCLhirf8SLLc93Q7P0A0SDMEKaqa58pDeXAOn4PS8BuxPPFwJiZD
	WApeM7NB1XZpeQ9g5ltAZ8eYxVrySK6r0YsKUd1eVoCBWEa0k3TIRwXQBqqzQFkWcoyKNDcYMy2
	gmy3LGLlbc2mPEEDb03vDoOBm9P/fQPWpYVjnuSIvgGuch9beFSZJ3r2MyG/aaGuXGoEhoRIVZU
	S1ezw5F5dKOph0Z5Ee3FyGl1jkcVWKvgiqmo+vgRuOd36xDSeUBtz2AB+6C6MIB8lbVPp+vV5Q8
	hnbDuvTZmyLrslkIDdEPQSmZZn1/p/sr3Nio7GgRzNVsTrVSPBmnOZs83nKzHzrtmkziIpCM0jE
	VFD+3/XKj7psV84igHDNGDLo/aCnp1BYNEMgfFDZw/MMX0w3QsfSzS2bVmIfN2iwjp+HN5ErGkQ
	7SJAHQrSbaXfKKl9SShBP1kVvQCw==
X-Google-Smtp-Source: AGHT+IEsUPVraniMkuTWC397mM/y7CFhjYXQZl0a4mAweu2WnF2gu2AEx/7J4AZSNaZAIT/grNKtTA==
X-Received: by 2002:a05:622a:550f:b0:4ed:6e15:d2cc with SMTP id d75a77b69052e-4f4abd72019mr459440771cf.54.1767030666405;
        Mon, 29 Dec 2025 09:51:06 -0800 (PST)
Received: from [10.211.55.5] ([209.81.125.20])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4da7c31a1sm145471851cf.5.2025.12.29.09.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 09:51:06 -0800 (PST)
Message-ID: <85d045be-7b18-4bf5-b6a1-09e723cad2a0@riscstar.com>
Date: Mon, 29 Dec 2025 11:51:04 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: Kconfig: spacemit: add COMMON_CLK dependency
To: Vinod Koul <vkoul@kernel.org>
Cc: neil.armstrong@linaro.org, dlan@gentoo.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 guodong@riscstar.com, linux-phy@lists.infradead.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20251226173228.2020411-1-elder@riscstar.com>
 <aVKy87c7afpWIx33@vaman>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aVKy87c7afpWIx33@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/29/25 10:57 AM, Vinod Koul wrote:
> On 26-12-25, 11:32, Alex Elder wrote:
>> The SpacemiT PCIe PHY driver depends on the common clock framework.
>> Not specifying that led to a failure when doing a COMPILE_TEST build
>> for the SPARC architecture.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202512251903.sTVZgg6c-lkp@intel.com/
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> Note:  This is based on phy/next, which I find doesn't currently build
>>         cleanly using "arch/riscv/configs/defconfig".
> 
> I dont build rsicv, I should add that. What is the failure you see,
> looking at changes I dont see anything that might break this


The clock calls are not defined in the SPARC environment.

   phy-spacemit-k1-pcie.o: in function `k1_pcie_phy_pll_setup':
   phy-spacemit-k1-pcie.c:299: undefined reference to `devm_clk_hw_register'
   phy-spacemit-k1-pcie.c:306: undefined reference to `devm_clk_hw_get_clk'

https://lore.kernel.org/oe-kbuild-all/202512251903.sTVZgg6c-lkp@intel.com/

(I now realize you can just click on the "Closes" link.)

					-Alex

>>
>>   drivers/phy/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
>> index aa2d30e0e3261..3bc7378ea8658 100644
>> --- a/drivers/phy/Kconfig
>> +++ b/drivers/phy/Kconfig
>> @@ -104,6 +104,7 @@ config PHY_NXP_PTN3222
>>   config PHY_SPACEMIT_K1_PCIE
>>   	tristate "PCIe and combo PHY driver for the SpacemiT K1 SoC"
>>   	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	depends on COMMON_CLK
>>   	depends on HAS_IOMEM
>>   	depends on OF
>>   	select GENERIC_PHY
>>
>> base-commit: 27287e3b52b5954b73203d32ee76ffd5f53f5074
>> -- 
>> 2.48.1
> 

