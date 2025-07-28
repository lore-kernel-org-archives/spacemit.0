Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC912741CF
	for <spacemit@lists.linux.dev>; Mon, 28 Jul 2025 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753721017; cv=none; b=TMmCIDXE/pQY8Oz+4Svs3VWGlyoNcZm6Djb6HTUH/6v41B5FIfooThv2S5qhPL16xyPfTRNGjsAxqQ272z31B8Jn0p0d4FK1zkqySP/eZHZDK1JFalds+k5zNKImOjuDKJpzWayEZrln8ki5DFPX8PDBCp0qHSqARNbMAcIpL1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753721017; c=relaxed/simple;
	bh=rhjEXzsTwnZFAF5osPavXR0nQ1U3valXq3FCuGUvhIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tW9HVdZxw2cX6E06zS/449mcy8dHl9VOWlq9LnefzU+rUcpV0cmYv19RcOALe8WqM9Xw3xTQT9IbD9fL20DZjnuzwOe1B5dnHo86pxvXjKWqY2PUz66h1u6vQxm1wWd7VeOKJjJJJ95hhxRKEPbfeBLCGmd/PVCHfu3wsNjoO1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=M+LtEjuq; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="M+LtEjuq"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-87c79b55898so118821839f.2
        for <spacemit@lists.linux.dev>; Mon, 28 Jul 2025 09:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753721015; x=1754325815; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ldQSwkThGxTZIExSscNpx1zCzTVrhc9kUZXUJm0UXLk=;
        b=M+LtEjuqYj8+IyVHcxFRrhATZws6rv+GueMpicyMo+3VJCxZ5bANwpxXnYKYUxrZSL
         gLgfl6EZpa/m/Ex8aF1+K6TNzHDMo8nr6KfYb7HNE3rubf0wSC2itaSmBChFLGOZEG8P
         PDW7ucoDk/C/eRAJWuiC5CAw6C0pjr9pq5EECHF2Xf/wWznWIsQODoxCQt0Nked8suaY
         FCuxg77M+0d2M3DUJfbUoqLKjsecZhq+QZEbJk/+cDM4u3UOi+VcNeBfFy0zZg37CqGF
         NdgeRkyjIW9FqE9Bs9c2Zx7AijMVTqXwyUEPIbIJ1A5WEUgcGNNAvIHJdy9Cu427UuFe
         tQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753721015; x=1754325815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldQSwkThGxTZIExSscNpx1zCzTVrhc9kUZXUJm0UXLk=;
        b=wkWNTFaGVBq6PkGMLj9hAgIyhv/srsjnoebPPolKN+i/sFvHEksjal12/fDmxfx/SP
         JEY106GOweUd1cpz4HJPU+CI04pux2l3QAxGGKnhLDXKfGgJLGelb9b/8zqGTe/rJ2LI
         G/JKPH4HmFACdYVA0UCzdHfherUfcuCo1YYj/Rp84tKAcrt36akFPe2feV3CVc+6m0Rw
         foHHswv8D+RicfJ6Tl5QXC0Kbls9rWPBRGtCrHzLDkxOPw5P3kzbJ7jZEj0jLPAkukNu
         4cKbLULJWlPVHtXDgy+ANf3k8kaAtyUmnlQN8IkiPLheTu3RnaXV/cMSL/llfIraRznm
         wUSw==
X-Forwarded-Encrypted: i=1; AJvYcCW/qfq+knLswTiSeBYzOQ6GuAT4FfbKeYVCGVqYGQJsRrMhznsNn1WusKvIY9Znw9RJjqDbyusVaA==@lists.linux.dev
X-Gm-Message-State: AOJu0YylDTQZif7xb5+Mtl8XiGlVE6JghnWFK9igRlzP6iYElUARaMZS
	wlaLTumxzhiZgmnDFByclSsmVSJoW8gwmMxWGu7bVda7rA14SIze5Dw8fHA9b5pMZ3s=
X-Gm-Gg: ASbGncvf0xzKY4UK+6Ii0BOqGS7xhLZl4mAOE72c3H1ddDWezcy0HbigpG4KW68Y0ud
	rAHf18Ry/vML/3hZYpPz+U42cIqeDfDDfybbYAuPohiXL4cZCcuKBWAZDkFBjcH9fFZqMuJNaPJ
	Csy1TlpujWD5yvqvH6qj6eKgbznQdCWwWnn1VhV13evwGmShkZ6Qu7knXTitPH3Xpp6aPhK9Wkp
	Q0yR/fB73eom0UgE1d2OlWkCo6xb4Z5eDE6Fm+WPOQi2EVl8Im51PxUmp7/9jZhQyZEYiYDbxWt
	HwDW+Ynv0cuTR41hlcPSzwzyhW5kbDPnwdH3it0IWIRf3A6+sULMNVx9zoloLmmHa2kqsemGFjS
	UZQE2BJL+4kttfRyCnIUbnBO7G/1HTXJD7z7hP/WQcK9o045JLjdBe3GCO6hd/P0=
X-Google-Smtp-Source: AGHT+IEKf13G5VVtKix2Gq667g//FiBaGINonaogdX3yn8hZwcFv6711Pe8N6gMwP+Vbi5i7MjtaZg==
X-Received: by 2002:a05:6e02:1805:b0:3e2:9f1e:e291 with SMTP id e9e14a558f8ab-3e3c53125b1mr209554715ab.21.1753721014595;
        Mon, 28 Jul 2025 09:43:34 -0700 (PDT)
Received: from [172.22.22.234] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e3cad13c7csm25861755ab.61.2025.07.28.09.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 09:43:34 -0700 (PDT)
Message-ID: <ef2b4526-3725-4a25-9118-ab77a1d91362@riscstar.com>
Date: Mon, 28 Jul 2025 11:43:32 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/8] regulator: spacemit: support SpacemiT P1
 regulators
To: kernel test robot <lkp@intel.com>, lee@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, alexandre.belloni@bootlin.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, mat.jonczyk@o2.pl, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux.amoon@gmail.com, troymitchell988@gmail.com,
 guodong@riscstar.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250726131003.3137282-5-elder@riscstar.com>
 <202507281558.lZ0NYtth-lkp@intel.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <202507281558.lZ0NYtth-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/25 2:37 AM, kernel test robot wrote:
> Hi Alex,
> 
> kernel test robot noticed the following build warnings:

I have a fix for this, and will include it in v11 of this series
when I publish it.  I will wait to do that until I get additional
feedback.

The fix is to make REGULATOR_SPACEMIT_P1 depend on I2C, in addition
to ARCH_SPACEMIT || COMPILE_TEST.

					-Alex

> 
> [auto build test WARNING on d7af19298454ed155f5cf67201a70f5cf836c842]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-mfd-add-support-the-SpacemiT-P1-PMIC/20250726-211530
> base:   d7af19298454ed155f5cf67201a70f5cf836c842
> patch link:    https://lore.kernel.org/r/20250726131003.3137282-5-elder%40riscstar.com
> patch subject: [PATCH v10 4/8] regulator: spacemit: support SpacemiT P1 regulators
> config: alpha-kismet-CONFIG_MFD_SPACEMIT_P1-CONFIG_REGULATOR_SPACEMIT_P1-0-0 (https://download.01.org/0day-ci/archive/20250728/202507281558.lZ0NYtth-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20250728/202507281558.lZ0NYtth-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507281558.lZ0NYtth-lkp@intel.com/
> 
> kismet warnings: (new ones prefixed by >>)
>>> kismet: WARNING: unmet direct dependencies detected for MFD_SPACEMIT_P1 when selected by REGULATOR_SPACEMIT_P1
>     WARNING: unmet direct dependencies detected for MFD_SPACEMIT_P1
>       Depends on [n]: HAS_IOMEM [=y] && I2C [=n]
>       Selected by [y]:
>       - REGULATOR_SPACEMIT_P1 [=y] && REGULATOR [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y])
> 

