Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C2C13DDAE
	for <spacemit@lists.linux.dev>; Thu, 30 Oct 2025 00:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761783017; cv=none; b=UR1cOHEEhTMgeUSCRFk8ceVzbP+WdcMBZ65UhQXXeX8TdfXwLGXgzUKWsTJBYzHpsMuiaU2TyI+r0fuIUqjb2GPvLBEoPZ0wOzfapGkpJF15BbV1Qp+2m9RgII8QZHOxvVEmCwktZEqWXH0B0M9Najz2QxEHB5eawUABYfT5D3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761783017; c=relaxed/simple;
	bh=sZwlNZfu08U7BZ3HE2RfjK57TGErNMnFRRHI06ayZtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jbMDoXBdMBaX/TE+sPVzloiK6wuOR0+kvvSB5EoAECWbfm4WKlgbcqX1QrJuHFHcnswnRik757+9KJAF7bp23M5suBIkazWKT5fsiPHXt7bGnA1hVoZ5QYY2Zg3pPeG8lwytlxwfOF4OKAj0DLdfsXf2x95yXUFMqZt4Nb0pNAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=NxCN7WwE; arc=none smtp.client-ip=209.85.166.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="NxCN7WwE"
Received: by mail-io1-f65.google.com with SMTP id ca18e2360f4ac-945a42fd465so19534239f.3
        for <spacemit@lists.linux.dev>; Wed, 29 Oct 2025 17:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761783014; x=1762387814; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7VMgrL4eh2mYx+l5oZfmNXv7av2SRwaUbOAevR++3T8=;
        b=NxCN7WwE6iqt+eh+QtYHiQPdGbOL27eYWKj4Hmf97XDB9zlnQuhfbzg+rjG2A6GWgJ
         BwG+WIQyAV5HcPCbYOzkQD9qgqKBI36QJTBFtBk0qPUKYWqk4odWLnJiUj8BMhNrVImC
         jVQ0ahRe047nCwm3VkISxTQklLG9p6DlcRogADopg6lAfRllWfwbfWL+YFfS3PnycmPS
         ARtW0jZr9HlXkMJ88tIc9iV8T+5cVyOImaYrAsaxHlrYKsTEzGXyBzqorFqkB/smXogh
         kQBoec44SR9mNJCJUQLfLqAZGjemrblPVPcks7LZbpOH65HZe6dno4r/LFRAV1Xd+5sS
         eRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761783014; x=1762387814;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7VMgrL4eh2mYx+l5oZfmNXv7av2SRwaUbOAevR++3T8=;
        b=jELvB2HZycVavwlHmyzRITM6YDe0VUIbk8Ju2zFs0fx5sgDB6+5y22MEyRpAJGAEjW
         OuGQlqpmXngJmtn+IzpB583aLQ4V+avmC+JK/Zfnhqa3q7QaDhaaDbdAze37gVfFn8V2
         X9MiD9ERolZ74fCl9rAmPv/36wzyOGGSKxMx87FKW77+EaR6vi100Uaut3Jg697CKo10
         2q2LP3xyjHpRVYZdfkzoN2hAOLzX1erqBB8/XO6U7vntrAVRhBeYzdlBiJbInNwlUJQk
         2iO/CtXM6mrz/gSipwSX8bEwkUs1AmpRPhqjnKbQEGdqiNufoS7HNirGVlLsXK+gqZ+g
         fXBg==
X-Forwarded-Encrypted: i=1; AJvYcCUuTS5T6IIcLsSgpafpzyV/kWgEbsT5bUscx5uttAJ4JidEHHDL3xbFlSldW1bnlx5rcphlxkjzmA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyak4zKb9QWMSXnGKWxDhcZSU5V3fDlved9Ty55FlzFLE74gqmV
	4MDFq40GU03K4ReEFN4tBfGtg34ek07Fe0fSrFNlbUwnVOgf/GdxiwL2T3LpJON8JMw=
X-Gm-Gg: ASbGncsYGBqAYERzRCx8DRM0PqLRIkvdbmsZ/O+R5Pzhwxmt0pyjUcTVV4LK73PI0+H
	D/WgQYtAvYaXyx8VO8NobCMPUKuipxZrG75cdIn082D/K0lJhJJGvF85SyN8VHoeUiFa2QNUtpT
	7swWgQEtkOQyqAPVbzTiCQSzhWyyd0uaz5LBwgZ/HWmoPaBhtGkNCKgVi32oIPLuL5VH1O4/yQ1
	MhaL0/8rFMbVG+3yv127pj54U2wcpFqOpYUpX5CZ9tLhXELy2FWMeC6ORHBZXjh2/teER7VFhQ6
	dNkKm0OV++kcJN8VHBPZXGSyCc9Hp2NrwP2ZG8W6XeAx64GWxLnR3/vj1o/gY+br9rknFO/RabX
	0EEcFGo8p1qO+QTYEP+YlwK9kkeq69O/i1CiKvTvpyJ/R5pk/2RpeS6WMQzW14PiLs+rrvlIrXB
	59MeuuvIclrT4qziV/H4jPnDAicZjiSfATDreyqn3l
X-Google-Smtp-Source: AGHT+IGS7Sez1Zsjkc45MiOR9FLqorMzZtLxO54c8lUefypNW27H7J3DhzlOczc822LiC/qSjQNUVA==
X-Received: by 2002:a05:6e02:1805:b0:42e:d74:7260 with SMTP id e9e14a558f8ab-432f9071e91mr71017075ab.29.1761783014250;
        Wed, 29 Oct 2025 17:10:14 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea946de57sm5939330173.34.2025.10.29.17.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 17:10:13 -0700 (PDT)
Message-ID: <9bebde96-485f-4f30-b54c-be9e6c16f2d6@riscstar.com>
Date: Wed, 29 Oct 2025 19:10:10 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] PCI: spacemit: introduce SpacemiT PCIe host driver
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 p.zabel@pengutronix.de, christian.bruel@foss.st.com, shradha.t@samsung.com,
 krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 namcao@linutronix.de, thippeswamy.havalige@amd.com, inochiama@gmail.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013153526.2276556-1-elder@riscstar.com>
 <20251013153526.2276556-6-elder@riscstar.com>
 <274772thveml3xq2yc7477b7lywzzwelbjtq3hiy4louc6cqom@o5zq66mqa27h>
 <4027609d-6396-44c0-a514-11d7fe8a5b58@riscstar.com>
 <paxtbwlvndtsmllhsdiovwqoes7aqwiltac6ah4ehrpkz554y6@uj5k3w5jxeln>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <paxtbwlvndtsmllhsdiovwqoes7aqwiltac6ah4ehrpkz554y6@uj5k3w5jxeln>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/25 2:06 AM, Manivannan Sadhasivam wrote:
> On Mon, Oct 27, 2025 at 05:24:38PM -0500, Alex Elder wrote:
>> On 10/26/25 11:55 AM, Manivannan Sadhasivam wrote:
>>> On Mon, Oct 13, 2025 at 10:35:22AM -0500, Alex Elder wrote:
>>>> Introduce a driver for the PCIe host controller found in the SpacemiT
>>>> K1 SoC.  The hardware is derived from the Synopsys DesignWare PCIe IP.
>>>> The driver supports three PCIe ports that operate at PCIe gen2 transfer
>>>> rates (5 GT/sec).  The first port uses a combo PHY, which may be
>>>> configured for use for USB 3 instead.
>>>>
>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>>> ---

. . .

>>>> +	ret = devm_regulator_get_enable(dev, "vpcie3v3-supply");
>>>> +	if (ret)
>>>> +		return dev_err_probe(dev, ret,
>>>> +				     "failed to get \"vpcie3v3\" supply\n");
>>>
>>> As mentioned in the bindings patch, you should rely on the PWRCTRL_SLOT driver
>>> to handle the power supplies. It is not yet handling the PERST#, but I have a
>>> series floating for that:
>>> https://lore.kernel.org/linux-pci/20250912-pci-pwrctrl-perst-v3-0-3c0ac62b032c@oss.qualcomm.com/
>>
>> I think that just means that I'll define a DT node compatible with
>> "pciclass,0604", and in that node I'll specify the vpcie3v3-supply
>> property.  That will cause that (pwrctrl) device to get and enable
>> the supply before the "real" PCIe device probes.
>>
> 
> Right.
> 
>> And once your PERST work gets merged into the PCI power control
>> framework, a callback will allow that to assert PERST# as needed
>> surrounding power transitions.  (But I won't worry about that
>> for now.)
>>
> 
> I'm still nervous to say that you should not worry about it (about not
> deasserting PERST# at the right time) as it goes against the PCIe spec.
> Current pwrctrl platforms supporting PERST# are working fine due to sheer luck.
> 
> So it would be better to leave the pwrctrl driver out of the equation now and
> enable the supply in this driver itself. Later, once my pwrctrl rework gets
> merged, I will try to switch this driver to use it.

As I understand it, PERST# should be only be deasserted after
all power rails are known to be stable.

This driver enables the regulator during probe, shortly
before calling dw_pcie_host_init().  That function calls
back to k1_pcie_init(), which enables clocks, deasserts
resets, and initializes the PHY before it changes the
PERST# state.

By "changing the PERST# state" I mean it is asserted
(driven low), then deasserted after 100 milliseconds
(PCIE_T_PVPERL_MS).

I have two questions on this:
- You say the PCI spec talks about the "right time" to
   deassert PERST# (relative to power).  Is that at all
   related to PCIE_T_PVPERL_MS?
- I notice that PERST# is in a deasserted state at the
   time I assert it in this sequence.  Do you see any
   reason I should assert it early as an initialization
   step, or is asserting it and holding it there for
   100 msec sufficient?

>> Is that right?
>>
>>>> +
>>>> +	/* Hold the PHY in reset until we start the link */
>>>> +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
>>>> +			APP_HOLD_PHY_RST);
>>>> +
>>>> +	k1->phy = devm_phy_get(dev, NULL);
>>>> +	if (IS_ERR(k1->phy))
>>>> +		return dev_err_probe(dev, PTR_ERR(k1->phy),
>>>> +				     "failed to get PHY\n");
>>>
>>> Once you move these properties to Root Port binding, you need to have per-Root
>>> Port parser. Again, you can refer the STM32 driver.
>>
>> I see getting the PHY in stm32_pcie_parse_port(), but nothing
>> about the supply (which you mentioned in the other message).
>>
> 
> To conclude, you should move forward with defining the PHY and supply properties
> in the Root Port node, but parse/handle them in this driver itself.

Got it.

>>>> +
>>>> +	k1->pci.dev = dev;
>>>> +	k1->pci.ops = &k1_pcie_ops;
>>>> +	dw_pcie_cap_set(&k1->pci, REQ_RES);
>>>> +
>>>> +	k1->pci.pp.ops = &k1_pcie_host_ops;
>>>> +	k1->pci.pp.num_vectors = MAX_MSI_IRQS;
>>>
>>> This driver is just using a single 'msi' vector, which can only support 32 MSIs.
>>> But MAX_MSI_IRQS is 256. So this looks wrong.
>>
>> In dw_pcie_host_init(), if unspecified, MSI_DEF_NUM_VECTORS=32 is
>> used for num_vectors.  If it is specified, only if the value
>> exceeds MAX_MSI_IRQS=256 is an error returned.
>>
> 
> Yes, because the driver trusts the glue drivers to provide the num_vectors if
> they support more than 32.
> 
>> In dw_handle_msi_irq(), "num_ctrls" is computed based on
>> num_vectors / MAX_MSI_IRQS_PER_CTRL=32.  A loop then
>> iterates over those "controllers"(?) to handle each bit
>> set in their corresponding register.
>>
>> This seems OK.  Can you explain why you think it's wrong?
>>
> 
> So both 'ctrl' and 'msi' IRQs are interrelated. Each 'ctrl' can have upto 32 MSI
> vectors only. If your platform supports more than 32 MSI vectors, like 256, then
> the platform DT should provide 8 'msi' IRQs.

I have asked SpacemiT about this, specifically whether there
are additional interrupts (I don't think there are), or if
not that, additional registers to support MSI 32+ (see
below).  In their downstream driver they handle interrupts
differently.  I suspect num_vectors needs to be set to 32
(or I'll leave it unset and take the default).


In the DesignWare driver, there are up to 8 "ctrls", and each
ctrl has 32 bit positions representing 32 MSI vectors.  Each
can have an msi_irq defined.  An msi_irq is always set up for
ctrl 0.

For any ctrl with an msi_irq assigned, dw_pcie_msi_host_init()
sets its interrupt handler to dw_chained_msi_isr(), which just
calls dw_handle_msi_irq().

The way dw_handle_msi_irq() works, a single ctrl apparently can
handle up to 256 MSI vectors, as long as the block of 3 registers
that manage the ctrl (ENABLE, MASK, and STATUS presumably) are
consecutive in I/O memory for consecutive ctrls.


I looked for other examples.  I see that "pcie-fu740.c", which
supports compatible "sifive,fu740-pcie", sets num_vectors to
MAX_MSI_IRQS, but "fu740-c000.dtsi" defines just one "msi"
interrupt.  And "pci-dra7xx.c" seems to do something similar,
and maybe "pcie-rcar-gen4.c" too.

> Currently the driver is not strict about this requirement. I will send a patch
> to print an error message if this requirement is not satisfied.
> 
>>>> +
>>>> +	platform_set_drvdata(pdev, k1);
>>>> +
>>>
>>> For setting the correct runtime PM state of the controller, you should do:
>>>
>>> pm_runtime_set_active()
>>> pm_runtime_no_callbacks()
>>> devm_pm_runtime_enable()
>>
>> OK, that's easy enough.
>>
>>> This will fix the runtime PM hierarchy of PCIe chain (from host controller to
>>> client drivers). Otherwise, it will be broken.
>> Is this documented somewhere?  (It wouldn't surprise me if it
>> is and I just missed it.)
>>
> 
> Sorry no. It is on my todo list. But I'm getting motivation now.
> 
>> This driver has as its origins some vendor code, and I simply
>> removed the runtime PM calls.  I didn't realize something would
>> be broken without making pm_runtime*() calls.
>>
> 
> It is the PM framework requirement to mark the device as 'active' to allow it to
> participate in runtime PM. If you do not mark it as 'active' and 'enable' it,
> the framework will not allow propagating the runtime PM changes before *this*
> device. For instance, consider the generic PCI topology:
> 
> PCI controller (platform device)
> 	|
> PCI host bridge
> 	|
> PCI Root Port
> 	|
> PCI endpoint device
> 
> If the runtime PM is not enabled for the PCI Root Port, then if the PCI endpoint
> device runtime suspends, it will not trigger runtime suspend for the Root Port
> and also for the PCI controller. Also, since the runtime PM framework doesn't
> have the visibility of the devices underneath the bus (like endpoint), it may
> assume that no devices (children) are currently active and may trigger runtime
> suspend of the Root Port (parent) even though the endpoint device could be
> 'active'.

So this basically marks this controller as a pass-through device that
doesn't itself change state for runtime PM, but still communicates that
somewhere at or below it there might be devices that do participate.
  > For all these reasons, it is recommended to properly reflect the 
runtime PM
> status of the device even if the driver doesn't do anything special about it.
> This is also the reason why I asked you to set pm_runtime_no_callbacks() since
> this driver doesn't register any runtime PM ops.
OK, I think understand now.

> Since this controller driver is the top of the hierarchy, you may ask what could
> happen if this driver runtime PM status is not reflected correctly. Well, most
> controllers have some power domain associated with them controlled by the genpd
> framework. If the runtime PM framework thinks that there are no devices
> connected to the bus and the controller driver also doesn't have the state
> enabled, it may disable the power domain associated with it. If that happens,
> the PCI controller will not work and so the devices in the hierarchy.
> 
> Hope this clarifies.

Yes, it helps a lot.  Thank you.

					-Alex

> - Mani
> 

