Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A432EFD85
	for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 21:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755120091; cv=none; b=YTTUbFFpa4nW3MKxM/rLUwkNU4Op6njekI99K+fHBCIXUFZjQLDJDuIzk7X7CXXX+O5NghaT6qKXHWK41abeqbLEs/6ZSgkUghCLnY6HHGdNkXU4ABSOBrbVSicxixS6WG6QDm1+wEK+AjSASacLgWNsAtPIfRKTZwhsxokS5Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755120091; c=relaxed/simple;
	bh=YRF7PXYqA5mGk0XIeuHC4a/zpxBzNwCOY5dVKL1K3Bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HPK+TINskfdzkAaSKTxmtE3cuSBM8TY6QAvxvgIkSb0+WPQZIInHuExjdSaPud9GZ1d3HyOZMxt0sHi8yIDekuvjPgeCFR9vFhY+1qpnMooowhUtxMoT4mox8ofEUJBE9lC1sHbJ7JKOC9GgmOEA0JzS49uZ5HiSEtPEirJdfNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=O7Gl0L/i; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="O7Gl0L/i"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3e5700448fbso2588465ab.2
        for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 14:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755120089; x=1755724889; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQFA3sAGjQq+4OU7ujcZ9yGUOwCjhbmi0pcUP6tFJ2k=;
        b=O7Gl0L/ikL6EeLx0KO9/HcQL3bwBV+SoxpnNuPLEGZqdtpEOIQPFv9K91BvYxZQCyk
         34n//oCc0HmSkT4jig4vhSCYxJjt5yKZjJH9STwBAYmIJur88t4T7t6iTPUzKzaC+ay1
         n3W6Bg0sn1agdt3YOiuYydWQUObrERlxgw/R4EcAoevRjkJmGZEz5G0KPCcJYakQx74O
         6NlleyNU1phcZeGPbJdRthJXOyGtHXi1Rv/DByq55vaL3kHCJM+Hn336w0cdqdv5ywpI
         KiVObGAYhZVz9uWK2i/rva7aTZ33MhYWjTy4lPq9t5xpDM08v0l9y5YNxZ9nGBPiTwXo
         XYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755120089; x=1755724889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xQFA3sAGjQq+4OU7ujcZ9yGUOwCjhbmi0pcUP6tFJ2k=;
        b=QT+RrEmdAtWFItDS6KBcVjm8xQ0wwvh/oGJGJq01BY8/yOEEXS7n/1+SbCc6DKpoQC
         gnwrWTBBl7d8qqji/5D+r4q+NLkGlefPVlfqJG6t2vsuJ7SXQjgCWSEKMe21fB2CGiv3
         a74nvINOp8Aqlud7YW86TKK/cfGihi5BBuPFX0EWDWVURZHWp9o2otmDohmt2r+BYqdS
         YG1wEuEyngiVQvDfbRRTMYE3FSVSJLqxuKheWiLKkKrSwcKqInpr9Vga/8KysrErVf7Z
         JxjM8Uh8LdqfU0HKp1CWr7ztI+QP8z2o3AKmClk42yz6r0eiieUc8EmQfcUsF014YkR+
         y9XA==
X-Forwarded-Encrypted: i=1; AJvYcCUo0BZUAgrYPDvcW/8SbY8FYjyD7zWjpUQTabf6n1VVNaLErXyfztHiIXFyZu9aC/5Urv8Gg+FKfw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywknv5szN+1WBcOkpDAXn8lqbcXx0Qvo4F9fHTzf7sQq/WY+DUE
	0gJ4eGj+B7ae/06dr4Ynb0pavMttIQMzCc+6qIDyQx+BnKK+gGc/w3YxUsu3+JhTn9s=
X-Gm-Gg: ASbGnctwCf1idUcfS6aXqaSDkExTe1YnhMnnxlV0yoTy75WG87iof3MpgAIWzVoBZl4
	aW5SU7Msejy+6UhPA16sriqfAyNd3TCsj8aqh4pc9sXfxAVHH99I4mW/u22LqYXxLKW/5XlGgmd
	OygmeA12CxpW4BrIA62Yj5iAbpghP/OmWmJurFrZgtv9iyJWH2hoA9FoUGREkJsWaPOlVe3Ejce
	sX8s7gsBSexWagDvhbQ2BF1L1j4gg6k5KPQlmYtq/StaKqtQeDMQvEdOnS2dAqwKJpw+zH8FKWy
	B1zo/xR1WJW7J0VJqcb8/pDAfmdJjnfzHJj0CwJcuSOVF63L/TFmNbbzDjjbPn0f8feO9+0cXcP
	PDvBVbaDGK9WxC1k5H/gPE0Cyq/A8v2j5PGhZuYi2hB/zSTDNUJEYaLnsGubQwTI3u82LPZux
X-Google-Smtp-Source: AGHT+IE/IGDUbFdQagnAGSx2I8HtgwdLHjigGbzbwJHyQIwj+Wi68+UGSe/1cR20+rAO3AtGn9HtGg==
X-Received: by 2002:a05:6e02:1c0e:b0:3e5:4351:ad0a with SMTP id e9e14a558f8ab-3e57078c28amr12232635ab.7.1755120085109;
        Wed, 13 Aug 2025 14:21:25 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e5418db19csm46937395ab.2.2025.08.13.14.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:21:24 -0700 (PDT)
Message-ID: <8ebc466c-1b9f-4ba3-a38e-bda6007c5b97@riscstar.com>
Date: Wed, 13 Aug 2025 16:21:22 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: phy: spacemit: introduce PCIe root
 complex
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: lpieralisi@kernel.org, quic_schintav@quicinc.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, inochiama@gmail.com,
 fan.ni@samsung.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 palmer@dabbelt.com, paul.walmsley@sifive.com, spacemit@lists.linux.dev,
 thippeswamy.havalige@amd.com, namcao@linutronix.de,
 linux-pci@vger.kernel.org, shradha.t@samsung.com, vkoul@kernel.org,
 dlan@gentoo.org, johan+linaro@kernel.org, kishon@kernel.org,
 mani@kernel.org, mayank.rana@oss.qualcomm.com, tglx@linutronix.de,
 bhelgaas@google.com, linux-phy@lists.infradead.org, kwilczynski@kernel.org,
 linux-riscv@lists.infradead.org
References: <20250813184701.2444372-1-elder@riscstar.com>
 <20250813184701.2444372-4-elder@riscstar.com>
 <175511815210.798605.10564052572461813362.robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <175511815210.798605.10564052572461813362.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/25 3:49 PM, Rob Herring (Arm) wrote:
> 
> On Wed, 13 Aug 2025 13:46:57 -0500, Alex Elder wrote:
>> Add the Device Tree binding for the PCIe root complex found on the
>> SpacemiT K1 SoC.  This device is derived from the Synopsys Designware
>> PCIe IP.  It supports up to three PCIe ports operating at PCIe gen 2
>> link speeds (5 GT/sec).  One of the ports uses a combo PHY, which is
>> typically used to support a USB 3 port.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../bindings/pci/spacemit,k1-pcie-rc.yaml     | 141 ++++++++++++++++++
>>   1 file changed, 141 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:

Mine didn't for some reason, so I must be doing something wrong.

Simple inspection shows my compatible string contains ".yaml"!

I'll fix in a new version.  Sorry I missed this.

					-Alex

> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.example.dtb: /example-0/pcie@ca000000: failed to match any schema with compatible: ['spacemit,k1-pcie-rc']
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250813184701.2444372-4-elder@riscstar.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

