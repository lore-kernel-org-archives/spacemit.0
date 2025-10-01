Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470B027602A
	for <spacemit@lists.linux.dev>; Wed,  1 Oct 2025 02:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759286422; cv=none; b=lK50Q7W1DGxExFGIhQc6cre6FmvmqAe2QF0qmcJvrnp/EdO8Zb31fJBwY7Iz841F2TXucw60Fq5y2kf/H2uA3AkX2r4e/ru837gEy3z+rjzt+MFlS8sUmfhqbhSAao0d07tW67WC7++P4fCIQmegAwTWkwN84dCR2+dHbNwZQ7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759286422; c=relaxed/simple;
	bh=95ml47WxKM7OsxOqgZUIEYLPG88WDEDiHa7cU33WvXI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=OVooLzNFgOzlPjqeYVPwqPcJBZgWkAfE9KD8d08xtPS4ZgU95twiXOhe6l3y4cmehG94p6QbLOlBNm/WFifcoOcfZuZSfG6ffbZ08zUlPlgdO5M03iJbri8R9OiRFTCITXAdBoQI4+KzWND6HQfaYJonvVzAtmVSWMWLsJRzkdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=lUI46d6W; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="lUI46d6W"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-93607aec358so23205839f.0
        for <spacemit@lists.linux.dev>; Tue, 30 Sep 2025 19:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1759286419; x=1759891219; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BSiL8LGa2xahx7enK5ghNLiWs+z0ni4QqOBXClR3tWI=;
        b=lUI46d6W5Rlh7R36Viru5edFeEk7XCumxmlwGR6cab4zhFVk0dMOn4cuOhTaxGnO8B
         MMnLql00e3ZXIfa6QXYmTKsjW5ZjJ+SvITlrUS2L1tSfv/LiCUlUyOkAH2VUgMKr0gO0
         THNmAEJpG+6O/46TQNxQ/pnSC/6CU5Wu9ydz8fIGGySsSyzjdwlZHVjgnRkoarCB5a0c
         5ZEzQrhMkhLnKGaO1iiY9W5uMF0LzYhkG51m9lLmG+dxbt/r2dXuVWfTqEZNa8uhWPoL
         sXhsCz/XaXmhHEOG38CZO+0oICZB7SUEKEZ+N3fgQY1FzqLe3zNcaZ57iRk0wVJvHUId
         hsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759286419; x=1759891219;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BSiL8LGa2xahx7enK5ghNLiWs+z0ni4QqOBXClR3tWI=;
        b=MmXGDzqyByiw3kuIIW+5vlDh2MR6hoWCnXNs9/e6OVGiqGlabEKPL1stuCrqe9CbWG
         Q2AHZcVvWzIk01w/CxaP5bIdREFW//sbdVwRHWgD7uG9pBTJz2E9ityJ7gdNbA0EM99b
         IBuWDaBbzMCwY90Vl/YLF81TfbqHHR3FwaAgi9QGC7cU6HRu+5CSxEVeFTraQd+0V0f/
         C6fDIW8zwmV3GDrfELy6cXzgDe8iyZzffVBq+Fw/XBvHGaDvqbxq9FCxgWLBHHFcnfYL
         h/aITto7JMY5QucB9v+XWZVgwGJQ/BcqoEANtUDPqTaEwukmmXfD7lY/D5R7b13jmDJ3
         FapQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfHzpe66a6AOLI+XzbpJv2Q7eBjyz+JHZP/PYLfrgx8GqUHAIbVjpgKKC/Lr73OXQ+bt2PScmERA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrOPQIRfR+ccYje2koIlRiR2YIbx/9RpWqdoS1tpewR9lCWimB
	0PlxdYIO8d8k8OvgNk1BRrw5jRmhNHtYsBLDLcFzTHBbuXDHZTavBJHthsB0/HW/myE=
X-Gm-Gg: ASbGnctl/j5IDjfG/vmhhCMpIA1qdqRZ2qZ3cRDBsqJ+eRF+Ebe/ZuTxrZSlulSEfiU
	RCdpe0BOWQ0gXF7p50x82NJbHPcWpDi7bFanA9EZ7QcggV1ngYeG4bBdyLVB4iwnpPdzaoPeto7
	bmZjqTZIUzMQ/snPy6GcThIzDnRU9CcMhklbIGmIxZoRHbpKiImYDPu3IFJWguSNDMf5TwEzGVf
	2rKBRZCHGQpKiX5Q5g8qw063TirLCS5+W/xkL3LAloQpHUHunu2aqSpmtN3pw0wxja9BI0cDwrO
	581l81LNkz4Nr2w0R746nw3KF+uRfkXXLq4gmFkJj2gtVpYYjirADr/zv+gZtAf5rgItX2QLTUi
	G1nJPK5BimjgEEOLOW9f3eOwrqXSJuHBs/R0ZgTCVyvbK0w7QbeaL1UBe1GxvewNHViArifkeZW
	YLpDZC4RVcvRUprG5yIKxn
X-Google-Smtp-Source: AGHT+IFnQ4AKi2u/W+a6GpDqwlkdiwJEehpu9YBKfYz9D/hyyMA4l6KRgEzrqCbvLsuK4qiSaJzeAQ==
X-Received: by 2002:a05:6602:6287:b0:922:6c20:45ef with SMTP id ca18e2360f4ac-937a9ff849bmr348732439f.7.1759286419402;
        Tue, 30 Sep 2025 19:40:19 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-92d06cc3b9esm184392139f.12.2025.09.30.19.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 19:40:18 -0700 (PDT)
Message-ID: <4ead7693-4174-4494-b997-c0e4159809af@riscstar.com>
Date: Tue, 30 Sep 2025 21:40:17 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] PCI: spacemit: introduce SpacemiT PCIe host driver
From: Alex Elder <elder@riscstar.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
 bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, tglx@linutronix.de,
 johan+linaro@kernel.org, thippeswamy.havalige@amd.com, namcao@linutronix.de,
 mayank.rana@oss.qualcomm.com, shradha.t@samsung.com, inochiama@gmail.com,
 quic_schintav@quicinc.com, fan.ni@samsung.com, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250813184701.2444372-1-elder@riscstar.com>
 <20250813184701.2444372-6-elder@riscstar.com>
 <sptrmspkmqrwsh2iv4rmha45vsoz5ks7vhcdp3dytsxyabn6qn@mmk7z6tf5wcv>
 <21ad322f-5abe-4a97-9373-d027b846ee8c@riscstar.com>
Content-Language: en-US
In-Reply-To: <21ad322f-5abe-4a97-9373-d027b846ee8c@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/19/25 5:10 PM, Alex Elder wrote:
>>> +static int k1_pcie_init(struct dw_pcie_rp *pp)
>>> +{
>>> +    struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>>> +    struct k1_pcie *k1 = to_k1_pcie(pci);
>>> +    u32 offset;
>>> +    u32 mask;
>>> +    int ret;
>>> +
>>> +    ret = k1_pcie_toggle_soft_reset(k1);
>>> +    if (ret)
>>> +        goto err_app_disable;
>>> +
>>> +    ret = k1_pcie_app_enable(k1);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ret = phy_init(k1->phy);
>>> +    if (ret)
>>> +        goto err_app_disable;
>>> +
>>> +    /* Set the PCI vendor and device ID */
>>> +    dw_pcie_dbi_ro_wr_en(pci);
>>> +    dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, K1_PCIE_VENDOR_ID);
>>> +    dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, K1_PCIE_DEVICE_ID);
>>> +    dw_pcie_dbi_ro_wr_dis(pci);
>>> +
>>> +    /*
>>> +     * Put the port in root complex mode, record that Vaux is present.
>>
>> There is no 3.3Vaux supply present in the binding. So the supply is 
>> guaranteed
>> to be present and enabled always by the platform?
> 
> Actually, I don't know, I'll ask.  Thank you for pointing this out.

On the Banana Pi BPI-F3 platform, this supply is always on.

There do exist other (SpacemiT K1-based) platforms that enable
this supply using a GPIO.  I am not able to test that now.

However I will add a property in the DT binding to indicate the
3.3v supply.  I see "vpcie3v3-supply" used as a property name
and unless someone suggests doing something else, that's what
I'll use.

					-Alex
