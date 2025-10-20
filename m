Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D481211CBA
	for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 18:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760983612; cv=none; b=MJCCwvkWFduyWsSHAH0HC1jn9E+0AKj8Ms4FM3Z3GHjV/0mW8tYhfIFcjhiotDyMJgvJtYIFiJVnU8Sh1ZpAp2NkwVmgb7RxFpH1bGa6bHA10k3IIkzIPoyvnUZeji4IVi5rjaP5iu4uN6/7Hap8XGdg4TGdbQkIOyadebAI/3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760983612; c=relaxed/simple;
	bh=SZsJevmbz8OxFMZ0VUQMEIMaBdwy5skEPKFMyP6eStw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qESDj7SSJfEiq1ugdnm7QFdNHPeSLvL1Vi+QwTLhq25n04kDi0sSRyzTAd63pIrwKjMAx+r1hoqlSlFT/XBWaxciIhiuhpeAvYEVbp2K/XcgJnXan8eelniEVi0p8SpLzB+YZEcAses8yX435EK5TAYUhTdN5XE2Kb2mcAcXOzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ADmUkLrT; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ADmUkLrT"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-430da72d67bso8646735ab.1
        for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 11:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760983610; x=1761588410; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Cb9G+JdDcieHiAzL0OEVFR37yQ/b0GUUu4YH0d0n0A=;
        b=ADmUkLrT6i0Rd1rf2iCjaYY3d9r2WIGjtPBTpVSvZhG2sg309+njVgEf0mBSH4CPXA
         JlMebfm6RX6ls4OLpMMwxxDlQT2dmW05+m4Nv06WGCJRTpe8EJsT1ky2vCkJ8OncNCGk
         pafLRxQ0mi0M8ZJpCL7Gl/0SKturzx1qywWBv2Z8XbgWc7oQZtuKVxPVSdLE41MTIZ5r
         AYvJ/bj0nF7SpV1FtXv+DiA+DVSTS1JUlVDPx2cB+uVLV3MiGTtM/i2vAx4kHn9ES2a6
         0mECZbO9p59gpQQ6KXRLRKQl3sYZk/hwZNvlM88Lbel6kfSdomQjFRuXhCYWYUy0xbr1
         hFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983610; x=1761588410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Cb9G+JdDcieHiAzL0OEVFR37yQ/b0GUUu4YH0d0n0A=;
        b=pk0NC37misHKB3tOVM3+dlT0TAJSEfej9XHDM/MAoI6cjC1VbmBpVAtUIEA5SNlvk/
         5BNeDB74LBCcGCx+v4wGtDaNsguS2HYthhpy4nKhYfy9YIX8Q/pxDqWHuHZ/T4R0nrgg
         kEzCHNmamSkkJQj9JW71gTDvQBEFd8Ot1wHAXsnsvLBXuoDCL+D1i5P2VHjhFdQD58Zq
         SGqLvbsfkTd+FsD+nCrELdBNSHu75moH/vWnnRDtD92UlHYoAzY1FJ6b8jTY8S7wKfLT
         KynzYujYCYS9wqAbVh4qYJaSvJ8GKcw9sdvyvHWoLLHlPt6VVHf63llhxEXNaQZm6jhw
         q8yg==
X-Forwarded-Encrypted: i=1; AJvYcCUkGkb7Xr7LZgoPke/w/2x3wrULW/GBngB6pRroB+QbPqISNikm/tQWnv9KlGqY63PUeVtF3FfNBw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxdbg1DNz4oO3Glzf8vGj2Bctl77NGfxLztvK0SiHHcICLcL6qk
	DuGwS3uK/kNgoAmiAxi+uYSABjgunzmKD4FbJuf5T/8rlseVIaFH6KSQgeteI2mPvmA=
X-Gm-Gg: ASbGncvz/kVs400yXtk61jLp1wYu31OnEn8jZEFvnTteNSJh5R2ch9+vApR2At3tJLo
	VeeTiw8UNn+cQm1C2LIBXaKBvGgR+MeKEi4hIQSChK1iZarM3nCGslRsnsTValhZR0ZGFAC+ObT
	gGYroUmllQu8YrolmaI4K5HfV/HzBgp0LEbcXXwMd0VLuAPlooFmFGiucW/txeIeUiVoqOwabGW
	CN26/TZKoK1TF27vu4MSD5s1HWDjQ9lQYYhT2Ntw0UvvCbZ2RITGpHI90pIMRs0JXRUss3MsTHj
	XuHZzz6WNTkYXDhEQ+30Rh85S93tgHWT1xdK/pnmSSubQOjfFMlXCJmZ70dT9as/Vos3TMnNCOb
	0FfN91uwCv/QFPBpvU+yAWbAGMu+pvX17gz6af29qDbc2W9c7ubcQMzEAZ6njjCyibdFEY7H7tM
	MOXYNNiF5EhP05Jv+lgkeCH24d5luK06dEmqsAXjtmhhUsRe1Qyg==
X-Google-Smtp-Source: AGHT+IFDdymJB2Qui1FemWWgGTvX6CFYwAWlPQ4NJbUO3JNIaIrN8E7GPCA9FCFosUo4bQy4mXpGxw==
X-Received: by 2002:a05:6e02:1563:b0:42f:a72e:e179 with SMTP id e9e14a558f8ab-430b43675e3mr253211025ab.11.1760983609985;
        Mon, 20 Oct 2025 11:06:49 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a961e88csm3172542173.15.2025.10.20.11.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 11:06:49 -0700 (PDT)
Message-ID: <09484591-e1e4-45a8-8451-afa8feeaf5a7@riscstar.com>
Date: Mon, 20 Oct 2025 13:06:48 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: spi: fsl-qspi: add optional resets
To: Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, han.xu@nxp.com,
 broonie@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-2-elder@riscstar.com>
 <20251020-henna-headache-fae4440ec7a8@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251020-henna-headache-fae4440ec7a8@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/25 12:44 PM, Conor Dooley wrote:
> On Mon, Oct 20, 2025 at 11:51:44AM -0500, Alex Elder wrote:
>> Allow two resets to be optionally included for the Freescale QSPI driver.
> 
> This is a binding, please don't mention the driver here.

OK, I will reword it in v2.

>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> index f2dd20370dbb3..0315a13fe319a 100644
>> --- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> @@ -54,6 +54,11 @@ properties:
>>         - const: qspi_en
>>         - const: qspi
>>   
>> +  resets:
>> +    items:
>> +      - description: SoC QSPI reset
>> +      - description: SoC QSPI bus reset
> 
> If none of the fsl devices have resets, this should be added alongside
> the new spacemit compatible and not permitted for the other compatibles.

I thought that, being optional, this kind of constraint wasn't
strictly necessary.

Anyway, I'll find out first whether the resets are even required,
and if they are I'll rework this the way you suggest.

Thank you for your very quick review.

					-Alex

>> +
>>   required:
>>     - compatible
>>     - reg
>> -- 
>> 2.48.1
>>

