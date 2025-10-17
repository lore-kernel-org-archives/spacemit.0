Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF51C2C0289
	for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 16:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760718042; cv=none; b=uE7d2S35OOuScj5C7FZ3gIqZT4ENZJc+DAgvdLdVQIH/fXWZHpfjewYS3fNxrAXKTft3EmpOlcWlSjaCPjEfxlBk9+ProsJS3Vzv5fVEoe4yFxmRRFbrmYmmAmagtxMXJILUg9YQaFCWRUZAEQqF6Q1fgV0sy0QBN46jh0ByX6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760718042; c=relaxed/simple;
	bh=gxKOH8Xdwc40yMCcxjDPNybQvl0viUGO00L2ILr5yMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WzvosBsqiL3dhJb6kuKL5kq+aaDxsWkLPKjsLSV81uNX8WfYZUXA0FjWObZ67ky9enqXJYlcVh/EvP0fbGsq8SL7rgZfonq+bes6Zdf6SyzFWGD475OU8dOgIN+F0v45M6qkzLVTjKilNWP32jhmKSSOZJRPN4FBo/2H48MFbBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ji1jXT/5; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ji1jXT/5"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-430ccd45f19so4191315ab.1
        for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 09:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760718040; x=1761322840; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CVQ6phuTO84kFBkRt8EnO28DbxtrTEoiT+THIp/h4p4=;
        b=ji1jXT/5TRUrWt8gxT0b/4xRJqtM+JpyEJu4LviiLg2c5bwcxDxCREYbM2jX90quLP
         tiisKX7Ay64G+7a8+UBCASL2J+az1O76dN7dZaA6I1nl0gKziuu8HXfaOznjASXO4C8H
         zw9dA9Yi50k+L4SuTC19fXERKbnwW+9SKHbDnLCFn2GC/57qo/d9SfcapGP7st7dTktq
         6N6ZGZbwN8uRmpW02rnLB4AIuN0sMtJL7yuogyrThZ2Kbt4W6IvKO9+5uPrcYDHNQwkR
         txR6fdjoegjJMqmetim8AnfHs0YZJCu4ZVBcr7XhE3XkHUIMOG/bc4PBbIoiqRbOa61i
         ZsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760718040; x=1761322840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CVQ6phuTO84kFBkRt8EnO28DbxtrTEoiT+THIp/h4p4=;
        b=KGO5wO4pwTThBOS3BJNdyUiUy7mE3qGTW/O9dofq5PYvmXk2l9O9HGPsCHhu80HnNQ
         Ih5wFDEAWCIaN4o+yp6ke0DyUbTltQRqE0Z6Pue2zT+kB8wyWBo3I435PCcaE2mKZreQ
         9J5Zu+ksB0UcRCXV4tqhJGMak0XcvTOlGn7mD1vF9ra3wthE2fFn33mVBCq3lXqLx2Ug
         Ca7xSnJ5AlTP6llvp+JgSs2PaEobmx9+2zdGMcfJddZBKdkqTO9T8OngPUt5N0bBjlLy
         HIHy95cmfS1aMzvI2HY6u0btkKwqo1iI0ILegmDp/9TmHRBGBFVYAcMP5ggPHAcnGBfP
         SbIA==
X-Forwarded-Encrypted: i=1; AJvYcCVvO4nEo/2R+JHhi9fXrAnpLKQ8+li4g2g5nPu2LoxI/Icmcz2121T5DVP/uEMywjbSNdlYExQzeA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/tw7MluBDfgAMs6LMtitVeufnExGkngUcSbPtzmI6LlTqA93b
	tDqn5pXYyxWxPVkV8sGKGuoOAAInJMG3CD6JV6ZVyie3naogkbyQmRzEfBygFXg9g7Y=
X-Gm-Gg: ASbGncs3DyZDwgYekbSEQBh2jKcKIZlj6m0LY9i618W3GCmbc0JZ6Gk8EvsMqe6yfUs
	bi9qVRQjKUxbCr354enRBxV5a9oEDB65c85bAqNSnsqPFUB7a0ePv6ojZuouHJg5nyaAoCOZCZn
	iuxoNPJNBKLxidc597g6289B7mGemlClTizRFDYxVh1pA408K43hiwxqcrpjO6VUvYaL+2ssjXu
	sbaiSyXHJfvVpsxw9ZLvU9ioesGwPTzA+liBbt53fM4N+8HNZtXGRAc48H+qtmde9fMm/UVZdAe
	ADim2T50xrcHyTFFpANrvF2T49qOgRMrv38mCgYPTXVriifuzagtLtOFZ2tbSDA+xX1DH6AzYMR
	c38UubVKxvwPfy7yUekX5/WLrC5mzCAWeF3pUTLUF1aBmWo8l2j/C9QBP6O/PY3Dh3yzoyceVcJ
	n2RR0ULP6JwJAn0/fsYZs4dnilozcz8Y72ed1u4Rs=
X-Google-Smtp-Source: AGHT+IHkLguz0srIwb9Y0kZ8Jj/SerEa4TnF03jUDSOPF34f5dBqn26UDMGx8TBiPYMDv2ZC0jD7cw==
X-Received: by 2002:a05:6e02:1d9d:b0:430:a65c:a833 with SMTP id e9e14a558f8ab-430c52ccf5fmr57021215ab.31.1760718039725;
        Fri, 17 Oct 2025 09:20:39 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a97689basm12877173.49.2025.10.17.09.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 09:20:39 -0700 (PDT)
Message-ID: <3ccf196c-aa57-4977-9dea-a54172e427fa@riscstar.com>
Date: Fri, 17 Oct 2025 11:20:37 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: phy: spacemit: add SpacemiT
 PCIe/combo PHY
To: Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 p.zabel@pengutronix.de, christian.bruel@foss.st.com, shradha.t@samsung.com,
 krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 namcao@linutronix.de, thippeswamy.havalige@amd.com, inochiama@gmail.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013153526.2276556-1-elder@riscstar.com>
 <20251013153526.2276556-2-elder@riscstar.com>
 <20251015145217.GA3554740-robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251015145217.GA3554740-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/25 9:52 AM, Rob Herring wrote:
>> +  resets:
>> +    items:
>> +      - description: DWC PCIe Data Bus Interface (DBI) reset
>> +      - description: DWC PCIe application AXI-bus Master interface reset
>> +      - description: DWC PCIe application AXI-bus slave interface reset
>> +      - description: PHY reset; must be deasserted for PHY to function
>> +
>> +  reset-names:
>> +    items:
>> +      - const: dbi
>> +      - const: mstr
>> +      - const: slv
>> +      - const: phy
> I think phy should be first as that's the main one to the phy and the
> others are somewhat questionable. Otherwise,
> 
> Reviewed-by: Rob Herring (Arm)<robh@kernel.org>

OK I'll arrange them that way in v3.  Thank you.	-Alex
