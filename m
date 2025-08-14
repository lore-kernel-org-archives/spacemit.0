Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4091318147
	for <spacemit@lists.linux.dev>; Thu, 14 Aug 2025 12:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755173748; cv=none; b=Wibm+6p4FqXkWnqxfLd+GQ1yl13+mTECAP/2tKWTCyF/jUEYF/nzTNR6qRhxPBh6y/mvZYC5mi1UWEIpfx7iJ6CWLU5A00ZLLBUkkK51xYuC1fyVJKvTfPhdQT94BmI5fUP4edzETntCB/jJt/WmXTIQIpAAFLk0IrzgrBCRbns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755173748; c=relaxed/simple;
	bh=7ez/y9SoR7GgwvoO0othTBNuBdwFuPF00uw0mKgomx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UxfdBiYfVSx9pCGYOWdc+TC9ak930DV3V1sdjNjb7aQPiHEOkc6YNIW0KjOEh1qmqFhKTYqWDIlGpXMZi4wkw85uYIVRrmjQ0sMwYP57TEJfWc57/I+neLFt0PtZyDJeBC0UjyAhHXvkeZh+nPOR/fsy9PFeemRxVlHGaVI1K1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=xugenQsZ; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="xugenQsZ"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3e56ff1f604so5404205ab.0
        for <spacemit@lists.linux.dev>; Thu, 14 Aug 2025 05:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755173746; x=1755778546; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jH/A5TldJIt0r8HRzTTERB8tMOGIsMMgINBB+z4/hxw=;
        b=xugenQsZKkdb444BmVSxiXkVhZD0ik0EzZV9l7VbJI/ktFGM+okrDexZaiRS5IFO7U
         boM4GVwjPrMKFeC90u33jQ8pfNbLrwZimi3jILuU7X9Gf24RzEj1XTbrIaPVw6tUkFiQ
         U6j+2wqp43Ag71BpdXroOOILySMrgakhBxa8c4SVlbwbc+KORuNgJwSEdBF+KrFvQ2y8
         YV417MHk16UEVHXF6y2lLr8qADAnQ9vRdqyusManwuGO/E/dciszBQ77ey7vhZGmz8II
         LozJN4noWMnA47bDXofMnY3t/ejtlFo+rFDTVowBJ+x7csLSJpmfCdYFDcHbRYhTbGxa
         FQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755173746; x=1755778546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jH/A5TldJIt0r8HRzTTERB8tMOGIsMMgINBB+z4/hxw=;
        b=Is0MgnEhiEtIry23HeL8BhycdWJ4R8c7ADrwvG5Ihsuu6DEI6WrTDQx2Q8oTx4QirT
         a3A1klDqMQXbj9Fs0g5lm6eDEPdNOGJAtC7lHPGvgilp7bHNLKraFVNHdxoKoGtApZy/
         s8E6UdJ1VI5BRAxxv5nwrzxwzETBJrVhEYthxmEc71r/YifdisQbSa/1NxqkI04EGUBv
         u/WhwzpKtqy3QjRtiJWYd86znDb0Ob4VEBObuG9jH8sh1yXPL6KFBfUGEdKqmg0uh1pC
         ggV3QdFmddOuIL5NIftepdtzpgzDZydpx8iU2Fl6jidU1JF6Ra0RiEI+oIrPZWyDzTGC
         7yPw==
X-Forwarded-Encrypted: i=1; AJvYcCUhRYKj8bjpag1TScE2oxkSrEBC1/0Py2eOyqk68oGUNmKA6UK5JEjuvWotLzKZoQwbXuAs2kQDIw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu/dyKNS3bAzGpEV97LdzyWvbgxIWjHbEjFO1o+Bl2VRwa/dMN
	+bSXc55DQZILYCv1i+xHjvuReI2l2rq9NsnuXg5/N4+kKfb2bnHHbGkZWq56SbNsa8Y=
X-Gm-Gg: ASbGncuFhHAfDtRBPrY3SgaAPPSK3Tfl/6byAmYnj8WpRHv9vhOn2LFDAl49CJurcj3
	nIedkFEoLXS2MFnitSoVaj0iaKF6PTmhC5dFHySyNM1gZbOQChF6tNIywXHMG4HHAR4+G6ZULuF
	TDtD24aT2nfs92z4bKQQl18oVHYPV6GkSDfJYP0p1MnkkoBGjZyD4M/obc0BPtuWQuqxtn7ppx8
	9miphYRd1KfP9OKt6icpC2kWZMFXZmODlhrLom8hafv3xZVD4H76NgSYMsoJUOCO8MqlZxMLbZF
	0gJR/873H1cpJmHNmGAbmUK0tJRst2H3zVxOSX2p6Vv5Jm5ctClR4mVaRYmxkskW420mMqiIpKP
	EJPRHcwGuySX8Lo/7RsdugjIceRyUiJunlFwRX33Tn0hcOp4Xg/QscbU9TXt1lQ==
X-Google-Smtp-Source: AGHT+IEk5Gf6e1UB1FErhDDdp2cqW5OM5qB7djdZQAW5/M0csvkRq5HHXBwlwGdJnT74jfJk+RYeIA==
X-Received: by 2002:a05:6e02:3bc7:b0:3e5:4631:54a5 with SMTP id e9e14a558f8ab-3e5709835e8mr60618705ab.18.1755173745691;
        Thu, 14 Aug 2025 05:15:45 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e55b077b34sm27683845ab.51.2025.08.14.05.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 05:15:45 -0700 (PDT)
Message-ID: <4eaa30bc-9a25-4fe0-b685-1d0d8fa503c2@riscstar.com>
Date: Thu, 14 Aug 2025 07:15:43 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] phy: spacemit: introduce PCIe/combo PHY
To: Inochi Amaoto <inochiama@gmail.com>, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
 bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 vkoul@kernel.org, kishon@kernel.org
Cc: dlan@gentoo.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 tglx@linutronix.de, johan+linaro@kernel.org, thippeswamy.havalige@amd.com,
 namcao@linutronix.de, mayank.rana@oss.qualcomm.com, shradha.t@samsung.com,
 quic_schintav@quicinc.com, fan.ni@samsung.com, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Junzhong Pan <panjunzhong@linux.spacemit.com>
References: <20250813184701.2444372-1-elder@riscstar.com>
 <20250813184701.2444372-5-elder@riscstar.com>
 <valmrbddij2dn4fjxefr46zud2u6eco2isyaa62sd66d27foyl@4hrhafqftgb5>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <valmrbddij2dn4fjxefr46zud2u6eco2isyaa62sd66d27foyl@4hrhafqftgb5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/25 6:42 PM, Inochi Amaoto wrote:
> On Wed, Aug 13, 2025 at 01:46:58PM -0500, Alex Elder wrote:
>> Introduce a driver that supports three PHYs found on the SpacemiT
>> K1 SoC.  The first PHY is a combo PHY that can be configured for
>> use for either USB 3 or PCIe.  The other two PHYs support PCIe
>> only.
>>
>> All three PHYs must be programmed with an 8 bit receiver termination
>> value, which must be determined dynamically; only the combo PHY is
>> able to determine this value.  The combo PHY performs a special
>> calibration step at probe time to discover this, and that value is
>> used to program each PHY that operates in PCIe mode.  The combo
>> PHY must therefore be probed--first--if either of the PCIe-only
>> PHYs will be used.
>>
>> During normal operation, the USB or PCIe driver using the PHY must
>> ensure clocks and resets are set up properly.  However clocks are
>> enabled and resets are de-asserted temporarily by this driver to
>> perform the calibration step on the combo PHY.
>>
>> Tested-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/phy/Kconfig                |  11 +
>>   drivers/phy/Makefile               |   1 +
>>   drivers/phy/phy-spacemit-k1-pcie.c | 639 +++++++++++++++++++++++++++++
>>   3 files changed, 651 insertions(+)
>>   create mode 100644 drivers/phy/phy-spacemit-k1-pcie.c

. . .

>> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
>> index c670a8dac4680..20f0078e543c7 100644
>> --- a/drivers/phy/Makefile
>> +++ b/drivers/phy/Makefile

. . .

>> +static int k1_pcie_pll_lock(struct k1_pcie_phy *k1_phy, bool pcie)
>> +{
>> +	u32 val = pcie ? CFG_FORCE_RCV_RETRY : 0;
>> +	void __iomem *virt;
>> +
>> +	writel(val, k1_phy->regs + PCIE_RC_DONE_STATUS);
>> +
>> +	/*
>> +	 * Wait for indication the PHY PLL is locked.  Lanes for ports
>> +	 * B and C share a PLL, so it's enough to sample just lane 0.
>> +	 */
>> +	virt = k1_phy->regs + PCIE_PU_ADDR_CLK_CFG;	/* Lane 0 */
>> +
>> +	return readl_poll_timeout(virt, val, val & PLL_READY,
>> +				  POLL_DELAY, PLL_TIMEOUT);
>> +}
>> +
> 
> Can we use standard clk_ops and clk_mux to normalize this process?

I understand you're suggesting that we represent this as a clock.

Can you be more specific about how you suggest I do that?

For example, are you suggesting I create a separate clock driver
for this one PLL (in each PCIe register space)?

Or do you mean use clock structures and callbacks within this
driver to represent this?

I'm just not sure what you have in mind, and the two options I
mention seem a lot more complicated than this one function.

Thanks.

					-Alex

> Regards,
> Inochi

