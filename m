Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980AA2FB97C
	for <spacemit@lists.linux.dev>; Thu, 14 Aug 2025 11:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755172798; cv=none; b=Cb7hZflYnR28Ya02pFT9oo8EptaCWVtPd961r7jtS41gi8wktRcEyMitzkeGHOKE7LyNI0eHVbFtN/m3hvJGUBziXWPGZReXnfF9C4mvJ2VV7n5n8jV+m4KPSO7pQLstG0aYhcecmXLoJYoVMF/uZ3/fwM/equyt2VOqj6dxW/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755172798; c=relaxed/simple;
	bh=HFX/Qwld+Sh0z4QKTMLIPR1Ye4VR7lyGLk0gc7fQ85w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KnrHOLtD9txW4/E7DVS7+7TZDyKUc79ag13TVokuO8L56LgNyOJ3ESdsb9i46MKQQipa4uXSFDZNFZdv3BajtbBULcJ4cJ4l2DvJ1rj1Hx+wDSOT7sqnlDd76q58JuhJxPIfw+HN4Th7SPH37xS1G1szI18j9NP2AvP1uMB3pA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=SMQErkM/; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="SMQErkM/"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3e57010bc95so8093355ab.3
        for <spacemit@lists.linux.dev>; Thu, 14 Aug 2025 04:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755172796; x=1755777596; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VkZ6MdXAK8oUuFYjzHuswEeWUTNOi4hs6qI/H9CSMKA=;
        b=SMQErkM/Fdl3wZ9JuW6bvDgD3buo3Ru1lt+VHx3PuL2Uu6KeEuQBH1M229n/FXQmzF
         xFcHDOoOOLH+/8bbkdavm5Y9kEOJTaepZVIy3W5zQp8eYSfqm2ADxcwVUPE3P6+IYDDn
         n3/ytwlC8qJVbXBJJ9EoysTyT341Ki8EPwLpuD/Vo4+z4cymdmOOEz3qAOy3NcYgauvk
         W+/EENmVjxm1s2uuNqFSRHzDSAepw34hf4MampBPYrLWGRQqs4V+gU9lrStmgKZsRTg5
         v3yD/R6Y8i33vf+ZnxF2su3ogm+6GwWp6sNhIdThTByi2jxJlNyqoB4eiyWfTqKBjihQ
         vOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755172796; x=1755777596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VkZ6MdXAK8oUuFYjzHuswEeWUTNOi4hs6qI/H9CSMKA=;
        b=grBSHr4dPVpJwYRz8+8/iHIfYR6U5o7DvNI4Iai8sfnyumRrMjzpXpFFZ7i84z17NQ
         eK3DOIfivoZdJOajlZzAxsQ8WQWPa9LN0tEjH6JGOXGTRSXXsLTbZFuA28QH/q+LJJq4
         PzUssbJtsPr+0lslZTsvG4UhzEepMeu9f4ubxeiujL8mJbZh+w+GNeZyjr5XauinWTuk
         ceyORPz8cHIMQKrnXNDCMpw2/rg61FMIlaERtamFblvapHrespqtYq57UT9ykNluQDyW
         NrwOQRg5NBA7Buj9KJzuAtGamdnHzO4+yUMHYANKgIeI+lIshALH3ZzsWYveSNAPOVMw
         WiIA==
X-Forwarded-Encrypted: i=1; AJvYcCWe/K75cBYWeAfnYOkiS9ZreyurehyKk4MWUEeku5gEUhJJcANEAfZ9Y1dPLY8fU68q5PD1yiz46A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzd0a1Tz2ga+b6vtxgw1kMz0SZF2C3A3A0bdrTxxQZP04abCnVA
	JDwDMv4k+1qVQGIt0Wp0825zXEdEA3wXpScEzKznZpdBX/UVyAW8TziJQ/v4UQbln0I=
X-Gm-Gg: ASbGncvIxVgnxac49124NingD76Sfbz5FbO7sYLs7Jl8nK40xSntQm9n9/mnzQgzSTy
	JaehFbQWWRWTv7q5j+7eEZZfJbrkyI2/IVoL/faK/rRj6B7afDnWvfIJ8CDzBGjCt9jK3NRjdp0
	GaR+xvPJ9XSNIgm2HJDcHaXGa6lzyhAC9T0TyRumDSNJGaU58ni8lAtIV6tTIahrh+OOs01Ipe6
	vn+u77co9hGGuWhcZenjdLTAwogRTcJNWC7Gxwcat3hnVrXo+01dZ9kxEB4kwqvQUklSgItPd/i
	6moe69aFFggsUn58JqoEAbawnw+Wt/aRPdxJmizSk6gGeX2Ux6DdOn3xuQn5e4jzA/pc4yo5zlC
	uw6u6f4fiUhGe8OT5qLa0P4K+zgh97rhALR/evsjEVc1lUBAkymoPjYYeS8KZNA==
X-Google-Smtp-Source: AGHT+IE3y11zxXdSZ7xsXLUpghewNnJCpWK8G2mFkAzcKjVS5vSn5G3dmjKvLqQoKez3LPNe1hHEcQ==
X-Received: by 2002:a05:6e02:184c:b0:3e5:6daf:ddfe with SMTP id e9e14a558f8ab-3e57084ff05mr51337105ab.10.1755172795698;
        Thu, 14 Aug 2025 04:59:55 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9cbb659sm4480210173.93.2025.08.14.04.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 04:59:55 -0700 (PDT)
Message-ID: <86174012-fd87-41d7-9568-f9c0b544c1c4@riscstar.com>
Date: Thu, 14 Aug 2025 06:59:53 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: phy: spacemit: add SpacemiT PCIe/combo
 PHY
To: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, bhelgaas@google.com,
 vkoul@kernel.org, kishon@kernel.org
Cc: dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 tglx@linutronix.de, johan+linaro@kernel.org, thippeswamy.havalige@amd.com,
 namcao@linutronix.de, mayank.rana@oss.qualcomm.com, shradha.t@samsung.com,
 inochiama@gmail.com, quic_schintav@quicinc.com, fan.ni@samsung.com,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pci@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250813184701.2444372-1-elder@riscstar.com>
 <20250813184701.2444372-2-elder@riscstar.com>
 <22bd5b5b-ca06-4499-b21f-22c2ff202167@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <22bd5b5b-ca06-4499-b21f-22c2ff202167@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/25 1:11 AM, Krzysztof Kozlowski wrote:
> On 13/08/2025 20:46, Alex Elder wrote:
>> +                      "mstr",
>> +                      "slv",
>> +                      "global";
>> +        spacemit,syscon-pmu = <&syscon_apmu>;
>> +        #phy-cells = <1>;
>> +        status = "disabled";
> 
> You cannot have disabled examples. This also means it could not be
> checked/tested.
> 
>> +    };
> 
> 
> Best regards,
> Krzysztof

OK I'll fix that in both places.  I think I just copied in the
actual DTS content, but I now understand the problem.

Thanks.

					-Alex
