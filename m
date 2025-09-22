Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A19A2EB5BA
	for <spacemit@lists.linux.dev>; Mon, 22 Sep 2025 15:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758555739; cv=none; b=J0WLU6kNBu4YycubuxGYxJaBKpPJpfcxv31uQ7z8f0NVN6Oo20FaSFMXVImy6wcR9S6mOyekD/clMlRvTbk3eTPwMNivF2xxdfN2/N5A7+KIS/hE8VNXLeovZ78jLaQLmTTrdzGNqhJpAtqd5aYHDJC4jzzu0kvotrrmDqrCK10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758555739; c=relaxed/simple;
	bh=46Fwa5GH7T8G+aDL/8NwZ8OeukXWlDLBDbwbkFuA9QA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=txLR/hW6FEc2ViVQ5sIKhN+7WlqMygZxkT6x33xy+7vOsrZhnkNqxSKFMicjVhck+xnOMC3OhBwJtEzWqu9/2cGzlg78dwipBwma6m+YMNHw/cmBXtT8Cr/TbesfKcjVngpFebyGO7ilxgOVlsIwW30MpB/kaiBfwVgFrxNZfmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ms5t63FY; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ms5t63FY"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-4248b320541so30245635ab.1
        for <spacemit@lists.linux.dev>; Mon, 22 Sep 2025 08:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758555734; x=1759160534; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fCb28mlSlNfcpBhhz89Sqz+h4hruBEOLY8zc9ehwxLQ=;
        b=ms5t63FYi/k0aacA3Ryb/u/d68YOTMOykdAUlozIQvk44J8D0flHozEe5wYiKhtnj/
         MH2h8MYi3fo4pJ6MA2lY1Jr1CnDHJ3VMkr/Dduz8pe+nL+9QRbvrWd3dJiZ+WF0WxLXY
         AwblKaUX3dEaBh8mPr3U0AcZgogvVvUcf0cz3n0LBjDTJ4j6D7O35R8aGzVUikzIhYY3
         qjVWAaFvMvEYAOok6UgGLv6aCQFqb/JstxQxLED9ZzwgyC8/F8yA9WDq4eEJHvatdmHp
         W+cmarIC+M7VVSayJ8jpZX4Si42O5Li1veVF++kem7PD44baCp9/BpZeJiwemR4TMTNl
         4CaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758555734; x=1759160534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fCb28mlSlNfcpBhhz89Sqz+h4hruBEOLY8zc9ehwxLQ=;
        b=D96l6/N3y0syuk2sCIQHKJB2gMqihxLZY8RzLA2zqHEJYNF4ZaxJrKxf2HGj86kNEv
         QzGR1iikgRED5AFK3fh5euickHaFpL+x+b+NVQoOtXv6RF3rnAcWFGrgSeDTowty9iaC
         Jwnyje/qQQVWP2iq7EYXj8VR07oxhYMCpJ0IPulaK89Dvu9rz9cN1Uo7zOc8kyw2UmOS
         UI1liOkuc6BJTCYszUArsDsC3njOGSqZKBhISHm+q3O/hJqWVFk0LXkLxETCky1o9+yn
         gs+UbeHqxYTKROYhpaTfdDmY5iztLQTc33EgwBira1A4pRJkKjzzeFxvTTTB14tp57x6
         RBQA==
X-Forwarded-Encrypted: i=1; AJvYcCVLY3yIWgafp2dTlc6MIB9cL7ZNIB3qK9qnGktmOynfHUo2bTd47Wvc7Sn3LcIMsYGa1Jkh/vlQsw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ+Ug+WNlI5SrVg5Az7ML6cn1YfesAT4XH3Qml9iCoB2wsnJqK
	L6+amG3k3dWR+EoaLetj8/vWiguE+wFrpM+Kz7gqau1JhFklVv2hR9n3XZ8qY6XG2yg=
X-Gm-Gg: ASbGncuNOwIceV/ZZC9nNvngMYrxDH46zweVltmYaB3RDb/UzvZax5A0yQZiBWTTXYr
	r1VV0sR1Df+//+JLR8k9YB6AuemPwCZrG6JBTPmUg/akm3jyJMKKQRjDBdiD9EUJFaPGvog5bEc
	vuMNgXDX+3LuxheE9CDap6g9uTruoJrUQ4HJAvYV39AAPQ0WW/Bg4qm0Mn/ONIw0JMgbT08qR+8
	zXzIIFlq6TGQ5j6YTFYF/dzAMrEQ3l6FWsT20FdmbHqtJohcVVo6ACxUVkm9U1OPgy9R9E3odYf
	WyVhaQ8wBHOPdGCzrSr3XDQW2NDQXmADdazQsNNyWTYPRcO/lZjcvdo58rcVgGMlxcM33PTxU/R
	OAMeBeg4BLdZjiGVxsUvxpApqNw5H5Gib06ShEsVu/17iQjFuONC9LUHDpoauNA==
X-Google-Smtp-Source: AGHT+IEN4LGz38AGZZTp4ukzEKIPIUkdoS/Gnv7RkPq76qCV6jt3rdGb1C+1QpNl8gxWwynbDMr/lQ==
X-Received: by 2002:a05:6e02:194d:b0:425:73c3:d25a with SMTP id e9e14a558f8ab-42573c3d2demr73984785ab.16.1758555734141;
        Mon, 22 Sep 2025 08:42:14 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4244afab539sm59790485ab.27.2025.09.22.08.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 08:42:13 -0700 (PDT)
Message-ID: <3fe0ffbe-b4fa-4585-b2d6-2437ade84928@riscstar.com>
Date: Mon, 22 Sep 2025 10:42:12 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: define a SPI controller node
To: Vivian Wang <wangruikang@iscas.ac.cn>, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, ziyao@disroot.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250919155914.935608-1-elder@riscstar.com>
 <20250919155914.935608-4-elder@riscstar.com>
 <50456256-fc9e-4de5-a512-5749b832dc3a@iscas.ac.cn>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <50456256-fc9e-4de5-a512-5749b832dc3a@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/25 9:57 PM, Vivian Wang wrote:
> On 9/19/25 23:59, Alex Elder wrote:
> 
>> [...]
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> index 6cdcd80a7c83b..f8c37d16968e4 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> @@ -856,6 +856,22 @@ storage-bus {
>>   			#size-cells = <2>;
>>   			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
>>   
>> +			spi3: spi@d401c000 {
>> +				compatible = "spacemit,k1-spi";
>> +				reg = <0x0 0xd401c000 0x0 0x30>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +				clocks = <&syscon_apbc CLK_SSP3>,
>> +					 <&syscon_apbc CLK_SSP3_BUS>;
>> +				clock-names = "core", "bus";
>> +				resets = <&syscon_apbc RESET_SSP3>;
>> +				interrupts = <55>;
>> +				dmas = <&pdma 20>,
>> +				       <&pdma 19>;
>> +				dma-names = "rx", "tx";
>> +				status = "disabled";
>> +			};
>> +
> 
> Is storage-bus the right place for SPI? I'd have thought that SPI
> wouldn't need its own dma-ranges if it does DMA though &pdma.
> 
> I know "dram_range4" is where SpacemiT put it but I'm not sure if that
> makes sense now.

You're right.  It belongs in the dma-bus region.  I will fix that in v3.

					-Alex

> 
> Vivian "dramforever" Wang
> 

