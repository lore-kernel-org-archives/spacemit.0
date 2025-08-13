Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953BE2253F3
	for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 12:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755088624; cv=none; b=ITvH8I83Hzn8684YS8g7ADSLwEqI+SR3jeg9UKtC1zsbXE3uZo7KplIKjtQtaqdP2HEYaE6y9dhLq3bHRjZnjxlrQodakPWLWCDieyUlzmzB8n9qRGaR1M3df/93KP11ve2Ul8Oq2mdLLG1delIz1ifLeHfgmrEgRFYrL5eODfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755088624; c=relaxed/simple;
	bh=Dio7h+uqlbgU4biS+L4BkekXjii6MxHsEIflkjyhoZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uC+mqOsrVTJzcLAe1QSRwHp8TUiwHpQpKtQFJBbVldSkFyhh3opSh9HQBp0i8S+5/vefCOQQQIrG0W4Vtm3LiPVGILaRSnIv5B4Mlr0hL91fhBdM8BFCouO/l0l4cs6os7naWqMSMAwsC7cVgvrqN/8pidzXks07v+iiF3Vfo/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=eHNxe29g; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="eHNxe29g"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-87999c368e9so555064339f.0
        for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 05:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755088622; x=1755693422; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QJSNE7TDIwDdVBJivdzquzFfOdkEAZ/NqbU/Si8oVJo=;
        b=eHNxe29gE4I8QTg5/kKoP0z+PzYw4AhwcE0hXGCpCtIos0RhEwGqKuLzEFhsXShMLo
         lSXDezpgTWn5HBLI3AxatBTy4HTWaaDkEuZjffH05s0G+uoMY7UrQn+s/ONs7rg/JzRB
         3CMs/1TLkos0G0ZE9a0Z3eVR7Jmqq5JxWhrETdlDtc8v45gtUTW9+ASf7kFQc8M7/amJ
         gPYMC9CIWNahS012xLz+LPInL2CtN4ESj8eRcXTiPZYAYnJ6/wyTWVyoF3GegRCqarY3
         3SCAgQBcaeYZR5KsAHRd+8Qu/EJCt0QHAAPZHNhYgTtppSPt6GUFdoS4r597Kf47kOXB
         ueXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755088622; x=1755693422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJSNE7TDIwDdVBJivdzquzFfOdkEAZ/NqbU/Si8oVJo=;
        b=UX0sPZ8Ngo9mhFbMLVT4ZWFU3Rsv4SYihRV481WgwSw34H7qh0LsHPihCqG9U9agdt
         P1MgaQvWLMiKt2PAOS5L38kSvgdmO3DnJCVtxHspcDbYhdaVwyz2ZEnySbQlrQmMa7pz
         A/h5goui7Gm3IMf9C18okY0Wpel8/6+trzNxJcb24ni2Zot1eblDFRQWCJEs2Scck4yx
         T+BEMf8ClhGq2wk6Ud5nfRu1iDyjVe+9Ic/dZAJujALVtoYtxXUHm7KkGCaqvTiEoktF
         P1G+uaBpTN2yB1WCTmu/UwIuoBhs0lmfrm6axkT1hSfbajBWlbF332W2i+QixmG+60Qo
         tYgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC39kXnLf5w/GtDfq+2Uf9e26h/na3ntKT4iyI7s92Vfd3PkJY9Ia2RWfUPiRFlR8wHoZiqzOoiA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFRLPoxWwUzx0hPFFvwPJ+iMiSVDAJ8QkwV6rpkrkVdUigl7EZ
	7KoiidW/LqmTRKCFzEXzOibAETdBp34WjdsFQG3dCuCcanyiso28/a0yN3w2PY92VYg=
X-Gm-Gg: ASbGncssg9B1Nnga3eKcvYQl3QCDNxOj8u2DvY3WPSDuvcdXHhtt3yh4q8f72/RQmDJ
	BfSJGiqNyhU4tX2F2rewkUI628kknBvx3+K42D3fXUGq9ciyukrezFDlWO1n5UdIsWtNat9W4jc
	21d706WDMCjPrNQZjJrYqOa4U69tSHwvq60w3wMEP1qARAry64R0LItWv+83zHEqWPsj6iwALvk
	/Cwa4hORX5DsSrolfS+vDEpi1kJVT3f0DH1l3QXzyIl0VmCloT5e1YyCB61kHDKctLm4JPHj0Gt
	6fC9WxyLk4kfqxkq7sp3sFROIIc9hriJbbsxRvjXjDiiPCUtyt8xhV+3SZANl9+GY02YWxzWqYB
	g61Izn301/fHbH0WqgXv90D+60Cof9Bn7WynIdXiKJ8JtqneIeMQpFN4aWop19L/FyQTqbrE9
X-Google-Smtp-Source: AGHT+IFnwEFQtUPVw9g9mmFiyfGLoS5nlr8HAUmqQnFfYA2GdWoqbZqkoS/L9fICYJiWR+VCb+vYyQ==
X-Received: by 2002:a05:6602:14d4:b0:881:7837:6058 with SMTP id ca18e2360f4ac-88429514720mr521566239f.0.1755088621539;
        Wed, 13 Aug 2025 05:37:01 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-883f19c1475sm445898339f.29.2025.08.13.05.36.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 05:37:01 -0700 (PDT)
Message-ID: <fd7ac07d-030c-41d6-94dd-da53b593f5ab@riscstar.com>
Date: Wed, 13 Aug 2025 07:36:58 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/7] dt-bindings: mfd: add support the SpacemiT P1
 PMIC
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mat.jonczyk@o2.pl, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux.amoon@gmail.com, guodong@riscstar.com,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250813024509.2325988-1-elder@riscstar.com>
 <20250813024509.2325988-2-elder@riscstar.com>
 <aJyC5q0X8mj1xbSB@troy-wujie14pro-arch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aJyC5q0X8mj1xbSB@troy-wujie14pro-arch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/25 7:19 AM, Troy Mitchell wrote:
> You can change it from this to my company email:
> troy.mitchell@linux.spacemit.com
> 
> Acked-by: Troy Mitchell<troymitchell988@gmail.com>
> 
>                  - Troy

I will make this change before I do a final version.	-Alex
