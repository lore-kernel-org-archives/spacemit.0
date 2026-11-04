Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806711;
	b=tLszH2JlmEoBeRPODM+meMMesU8V6b8WpxjIQQENQhab98YAHwaRsftZbn9Wj+MTCg6J
	 WpD9tn/4fWmUVVks3VJ58xtMy2QhXHZJgDdLyp/7K7Vb9UVw0rJ3N8h9JDOWn/DIamGnd
	 yjgi5QO62E4dZJNEKyG2HIU6AFTt6ewZnzmc9+SJLcBq11WSzDnIHHlKkTevaSnRnk049
	 /a9Q1UY6BZakHtO3h8ol3l2UrhHoTXh/EULdKPzgfHsmXVrBJnHcmBRlDFLks4a5cFKl8
	 9KQDCfiFJgV0y6qQ8nhnOLvgBDIyRld3wXO6zdEbK3BWMGJ+g7zWrwtnuvg65wxoMXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=N69nyzayYSxR+NwYu0yvIulH3s3QqZkTbmCgK6AZMFs=;
	b=jtO1y2u8Irs4Uo1DgnZcAimLhABBv3LNOFzSyTGMaDGE7vaNPQE8AXmf3pu+ysOTTN1Z
	 2NWVTEtOrqfM0MCQmsu5wFgHY48tpfLQ2S789gAFOxYxeUl8pFj5eNqi/lIPHKg6B0rmn
	 oImfd+S+d7c/a7kZW732kV+yIAV7EsR3A8ji4oBzR+CPjDQrs/EfJ277sbtLcbOK07Id8
	 wlzBF2SM3rhdLJ0t0u6LiTTPFL+1NRqVA5gdgRRtSVkqCBEynQNsGIqutiyRHxUV/2ZVJ
	 KHaNCdBL1uzXKlgkQpYQYdOp3ypaVQ1ir39Fvon3g4JtAODSIP2nm9hmIICVkKyf9gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yLhjg5xJ;
	arc=none smtp.remote-ip=74.125.225.136
Received: from mail-wm2-f8.google.com (mail-wm2-f8.google.com [74.125.225.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E26C6082BDE
	for <spacemit@lists.linux.dev>; Wed,  4 Nov 2026 15:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E26C6082BDE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yLhjg5xJ
Received: by mail-wm2-f8.google.com with SMTP id 5b1f17b1804b1-4a77811be24so3795855e9.0
        for <spacemit@lists.linux.dev>; Wed, 04 Nov 2026 07:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793806709; x=1794411509; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N69nyzayYSxR+NwYu0yvIulH3s3QqZkTbmCgK6AZMFs=;
        b=yLhjg5xJ1AVy/IoOiJRwzYy5yY9f2ULyFBX18QCfBj/+5QsH5PTek5hcyT8XR+LUUm
         bO+ApI3j5OKOMq1boxTz7UgPqEhGGbdkdx7bNOcXvqOKhdjorui3JSr/N4AeZJ/6ROl0
         DGAN7i0ZlkB0LpKYdYZPH37d4IzsKZO1teyOInrCy5LrSaE55DrdSpXwP8qpu13472CF
         WU7NPIL6/D4uR8Lm48i8Q8xCJGImaRtM0g/SzZAF8RqIGjIC7rLLbyadGIFqUc0x4CVu
         EXp+NsUCwhNINvwtuMU2ZABIC9JXv5lgP0gjwTP6+oc5M97w6vePr6unRK5Xe8VxrZmB
         FWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806709; x=1794411509;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N69nyzayYSxR+NwYu0yvIulH3s3QqZkTbmCgK6AZMFs=;
        b=o4mXsq2Q2YIstwBkvfZbNXwze60yWZXsDLNVJxQ4T3MmTrWDft8vzXY3BoJO5RJBo1
         XmGOIUeNBQny8x1dUwjmOn9G7MEc3i60B9CYj/IuNbl8VYdjZ2d9lJuUxbrk+uX7FfXU
         oGAu1Luvvu21j685EO2047V4GrXlONwYV8+Sk92/TEO4l+b0GwufDqpDKi811Skd1UiW
         wD4+ycN+MfsZTBfLI56ebtHl20MTM3lWxtG+P7ZOsBHcPuYPvMmvseMp50TU0ATKLhSI
         c5EZjLFlKjzXbEQ+4622WVKBbAPT/XCyryOgUI9FqhTYarti9DksF+39Z93a3TPfNJ+A
         i6Kw==
X-Forwarded-Encrypted: i=1; AKwUvBxC4ShceALSNedioS2VZ0eOuaNOwXPEjJEy+m+ySegCxgLgrdHj74o3DBGAeSZyO5x0tBn/sTdD2g==@lists.linux.dev
X-Gm-Message-State: APuU4Z+KGbhm0LPl4544+Rahdmtq+Vj2vyGYJRDODPkaJ50gGx7xm1N1
	OdwYeLXPnFx83Merc5jEWFoholEOmKC13mSLtEuOlVwGzYed65mamgT/
X-Gm-Gg: AYBFou3dESy+jVukZmtHaEQjTJrcI3HA3Jz9uH6XYpxsZsjFQWIp2BQSIuYDotoPs+C
	/Wo9v776rc78OI3XUhAfELLa/uXm/Omr9q2ES3MgjK7Rslof57xtcHJAtyOifTGJ3h0OISHSl3y
	X/0BreYLhyWSORmKytuGShlD6irDAAqZZrk20COQKimd7d+VnK2mytrY9Y1dqSxag6CVpi5OQpl
	QxCFkIBzAAc859MCw6Mb7NshFV227U0ixQxnDx6MF1Kj5x2nS0TSJ6/4GZrmZ6A/NuDiad9/n1N
	wiIz9I9fqO/sBAOjQsB2uEwKiwXsl/ofnFnOJpZ9ya7A3XygMDnp1c5B5uKq2hcY1QYR5T3auBZ
	LE5Lrsqn5LXf0FjjB3WnSc+FpF9WOT2mkkIAdb9YHzTHq4V4U/IwQdZxnel91WnmgJWfAHMt5s+
	7o+Ucs/S2RpRfrcycQNiQEcQnJbnHVvM0iY6L/5zwG4MewpDVZuIht8UJp/OwZbiSRdcNVCyJ/C
	D77xYEFNUtEK1jDLyeOXTCKFxCEwqJlmD4SuiWlgdfwSEgUzVx/sTMv+7bJ0F9T3buwrSD34ZHo
	IIjinkWEW9UW1cAP//DIP4/9m7Dju24AeRQOJHkr
X-Received: by 2002:a05:600c:8706:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4ac1765d3ddmr394129375e9.21.1793806708283;
        Wed, 04 Nov 2026 07:38:28 -0800 (PST)
Received: from [192.168.100.182] ([182.180.105.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43c17ecdasm89849875e9.5.2026.11.04.07.38.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 07:38:27 -0800 (PST)
Message-ID: <496706c6-e15c-43ab-ae0f-6230e098dfb2@gmail.com>
Date: Wed, 4 Nov 2026 20:38:23 +0500
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: spacemit: Ignore PERST# bit for controllers
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-pci@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Ping-Ke Shih <pkshih@realtek.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Alex Elder <elder@riscstar.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 "open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
 "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
References: <20261104140750.761330-1-alitariq45892@gmail.com>
 <DMMHM7OIO97H.2SHNC575QC4PY@linux.spacemit.com>
Content-Language: en-US
From: Ali Tariq <alitariq45892@gmail.com>
In-Reply-To: <DMMHM7OIO97H.2SHNC575QC4PY@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/4/26 7:14 PM, Troy Mitchell wrote:
> On Wed Nov 4, 2026 at 2:07 PM GMT, Ali Tariq wrote:
>> The k1_pcie_init() does not set PCIE_IGNORE_PERSTN bit of the
>> control logic register, which causes controller to reset itself once
>> PERST# signal is asserted even when acting as host.
>> On Orange Pi RV2 (SpacemiT K1), this resets the controller and wipes
>> the IDs. k1_pcie_deinit() leaves PERST# asserted, so when k1_pcie_init()
>> runs again, its first DBI access hangs the CPU.
>>
>> Set PCIE_IGNORE_PERSTN bit of the control logic register of APMU
>> in k1_pcie_init() before enabling resources so controllers
>> dont end up resetting themselves when PERST# signal is asserted.
>>
>> Fixes: ff64e078e45f ("PCI: spacemit: Add SpacemiT PCIe host driver")
>> Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
>> ---
>> Hang log: https://kernelci.cloud-v.co/scheduler/job/420
>> Fixed Log: https://kernelci.cloud-v.co/scheduler/job/430
>> ---
>>   drivers/pci/controller/dwc/pcie-spacemit-k1.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
>> index 92a71ea90ac3..af6028e8825a 100644
>> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
>> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
>> @@ -47,6 +47,7 @@
>>   
>>   #define PCIE_CONTROL_LOGIC			0x0004
>>   #define PCIE_SOFT_RESET			BIT(0)
>> +#define PCIE_IGNORE_PERSTN		BIT(2)	/* 1: ignore PERST# */
> A similar but earlier patch can be found here [1]
> 
> Link: https://lore.kernel.org/all/20260924-spacemit-k1-pcie-fix-v1-1-002b5c1ba9fc@linux.spacemit.com/ [1]
> 

Thank you for pointing.

I missed that. I will check that patch.

You can drop my patch.

Regards,
Ali

