Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E442D0267
	for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 18:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760983616; cv=none; b=WCmk/wUx/ECqOIAAbuWeSeBGIh3YD9rIjcfjoA8fkFEpA5yvVVZzYCxuVm5nWxUgLec5G2UCjp/w7RjyTcuUjoQSfwMEp8hv6VlaobJZEwb4f/WCZbndjf7Z8WFCXudgSiGfr98VbqKZrzpMtng5PGGQKL2UiEOTVrtzPWq/eBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760983616; c=relaxed/simple;
	bh=QTpmX6jrERRcIBu+6XueQEVtWkDEmNTcFOC27A5EpZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LCeE+/xmJhyD+t3hVtbClbE+8rTwpJ8AbA3ENbOWt4Et/NOhO++Fo9ACSuDcztJtDGXt2rS2M2NUydt57Md2TUtCfKDS3Ms1UOd2+0mvF/U6ywUBoSWXbu23V2GeGL46M8ayhwSjZsW6uVj1SK0nnHuulSfZqD56MUQJTG/JfC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=lLrd/i9Z; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="lLrd/i9Z"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-430d4cf258fso8476535ab.0
        for <spacemit@lists.linux.dev>; Mon, 20 Oct 2025 11:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760983612; x=1761588412; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oXBtLkkB0DB8TY2tig01PgEU/TWly7nbkJIcjJq9f9I=;
        b=lLrd/i9ZmON4Fi/mTU+B74l02JVNHP+Uca6TkXmgDDsL1KYNmpMnRa0SWmxFsJguo+
         YWWxpC6hS0VABulhXesc8VKuFZ5aPzsuSkuRBJs20RaOGJibrkDW4inii2wH/d2ttfq2
         igucvSL1uhWOineeigBJvVAvf564ZZAyiFVwTVOfXKgZE/ARu96OLUp/r4rhpFdlZrV+
         l/Cdd/FLP9K47I7MncSD/gxUBoOWTU9ceH6o8nUV1FQmBRa62uXgGaGMZQKDWSc+0EAb
         2KJ/6ta4476lLxNK0ZZiq2M5KhALZoyqnFtuwtTc2x3yr9r1Yd76LeDZ/g2ghQ8rGbLV
         UPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983612; x=1761588412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oXBtLkkB0DB8TY2tig01PgEU/TWly7nbkJIcjJq9f9I=;
        b=CMe9Ki/ka3xBopDtJrgA0fS/7Vnmq3me29BO/6I5hMlTE9h98SM/6xmkNikLbakCQr
         cut4HJwYmrwBldtqOnrqTcOQMiaXpAJ85ioPDigpjRARcX2S3SVvbVVjidoFhYUVF55w
         WD7OjJ9ILq+oS5r+sUJtDgj39g32gXpb4MViVTWOpXV3aqugbnKP0F5FiVrq66Jm9+RW
         CcvpusybCh6ZQHAeB0PA7Sz7SKWkjcNKAnbxLtnIFaMMwrpxgibraTe7cgRgncNlVJ2H
         6Fs2pYUrZS94A/y0CEn4TSC8HiZYkpWHx1sjUPGZCluyImQrS/wuLYIzr32hrfuv3BwW
         S2wA==
X-Forwarded-Encrypted: i=1; AJvYcCUfNGJHZ2RUSuEb8PpryN2/83q40tt7/n2DafyMfGjgkFH8wr8VXRD/8lEv8EEjyMH+Iw54FcpsSw==@lists.linux.dev
X-Gm-Message-State: AOJu0YytMFCJnVYPhde/BzTKaQMQnI0S89FllOIql71PCPtJzKScJZUE
	mrFK3gY1ZwTPzEGuwAG6eyJAFUwsZPIU1IU6vtwe9rGEvvLAa0hZRVCyAFea16Iy1Ys=
X-Gm-Gg: ASbGnctF1LtbOeX586l2pBOagrSp6QaG16uxisFQC7qArjGcVJZ9vA+c6O8y4/LQaeF
	4ot4NcQdHl3PyJN8u1GZf0JONbaxrsGgTMqr6FROrbSs1eS0357cBiuGFUOOH5E0e8CaROVA2ov
	vFhsitb3C59GfD5NZMs5SxhAX1jv7Iv6MUBYfn/XotOPBccKtxlgIpCH01WnNWmFDOQnDNVDl+K
	BdrxXdzks3gxZq5fY3YY0Ss3+F3CKp7TZ9SV9nGYIZzsfuhlPULLZfHRDQROWjkSgkJxkQo2v7q
	egaYpvZVJXf4rqhXVF5ZaYLnGkoKeQ528yOrXuwJOd1z04RSN5JvNwksG3ejKdgqaj0SyUT7n4l
	QwFRIkrrpHQyW96xGJiHSjmnUqhOnP6O7JkBlHBkfrUCa3kF91dgNfYYIGbxx+X7KdUNq4EWXf0
	RumsTVnSQ7ElRSAntR3OalJwSr/E+aCzkU0EvwK7wqd8nSOngO2Q==
X-Google-Smtp-Source: AGHT+IGevb4egGjj6KWxQP35Nq0zUYSUBGNvYU6Luo+078jNAKiHY5b+2d/guD5dVmi2NJ4AhRB7Qg==
X-Received: by 2002:a05:6e02:190c:b0:430:bf84:e941 with SMTP id e9e14a558f8ab-430c51ecf81mr209120355ab.3.1760983612156;
        Mon, 20 Oct 2025 11:06:52 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a961e88csm3172542173.15.2025.10.20.11.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 11:06:51 -0700 (PDT)
Message-ID: <08d99fcd-4d0c-4d81-a314-7e1a8bfaa64c@riscstar.com>
Date: Mon, 20 Oct 2025 13:06:50 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] dt-bindings: spi: fsl-qspi: support SpacemiT K1
To: Conor Dooley <conor@kernel.org>
Cc: han.xu@nxp.com, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-3-elder@riscstar.com>
 <20251020-utility-remedial-4b4dfc716409@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251020-utility-remedial-4b4dfc716409@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/25 12:41 PM, Conor Dooley wrote:
> On Mon, Oct 20, 2025 at 11:51:45AM -0500, Alex Elder wrote:
>> Add the SpacemiT K1 SoC QSPI IP to the list of supported hardware.
> 
> Also, you should really explain why this spacemit device is the first
> one to be in what's been an fsl-specific binding for now in the commit
> message.

I'm not sure how much of an explanation you're looking for, but
yes, I agree with you, it stands out that it's the first one, so
I at least should have acknowledged that.  I'll add something
here in the next version.

					-Alex

> pw-bot: changes-requested
> 
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> index 0315a13fe319a..5bbda4bc33350 100644
>> --- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
>> @@ -22,6 +22,7 @@ properties:
>>             - fsl,imx6ul-qspi
>>             - fsl,ls1021a-qspi
>>             - fsl,ls2080a-qspi
>> +          - spacemit,k1-qspi
>>         - items:
>>             - enum:
>>                 - fsl,ls1043a-qspi
>> -- 
>> 2.48.1
>>

