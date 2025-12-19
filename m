Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70733469F2
	for <spacemit@lists.linux.dev>; Fri, 19 Dec 2025 15:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766158099; cv=none; b=f7MI29zc/GxV0gGIXBm733hNEhVyNEt/HmyywO4rTxwSpMRAeFUDeP3yqHwN+gjUtCq+9iyyHH1fNmKq7VPQYZtZkM+kwhQjZpWfzxjryZbs1hWZ7WwG0Y9ZWPmxfO3/AEj0GbQkVakfM3aXOsrCAlHS1l1jrWJHv/XVkh/GJPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766158099; c=relaxed/simple;
	bh=nrU+G9HsuMxAyqfxgTpRptoqpXb6zEpgTpzqtiAbz/Y=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RIUMbRrzT0D3uBbS5Iu3N7jU9cKQuBw+3ss5GdmUqGYbrBhM2e8mZZCIv46rjnsg2l9Lbax0O/m2Ji3K05gs65G57/Ohto0/2jpldIoEJJQwPo9TQCfsEkfgoh8VinyMieTBVA5f8T8f6QiwQWz6ZWDfzQPpirva4K69fXrHNmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=pXIxXQXn; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="pXIxXQXn"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-88a3bba9fd4so18486856d6.2
        for <spacemit@lists.linux.dev>; Fri, 19 Dec 2025 07:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766158091; x=1766762891; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yf0ImYCnIty6Hsv8vMFIKwqY2rPgEKUaMHY5AG2sRYk=;
        b=pXIxXQXngHwvOgnCJ1+h5Ua7QwRfWCE9mN8hytaQK7/xrX2I0Xj8j/Kpwb1G/0xd93
         j15a2f/9l/R2ht0ipML+1xFW8aX2oW99TM4HR+A75ht6/5fqGAuDdOXc2YgjgkVVbw+X
         RgmzvPIWMJLYHgIsy32PjE371ssRu1O09HL/1QENBHbDwBdttjb+1+XpMi8Sbtt831pz
         pHzLC5d3JLIKQfXGp/XhODhtbR6ZIvjwBmzUsLCHYQqhewZ6RDgIHyQBxVp2l8+MyDYw
         egfluXHoKWw6ED2mtEsQsjJR1vCYeQBXEdTvfKPzOJUnMxCeWpzLRSUdIhidQNa7RHcV
         ZGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766158091; x=1766762891;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yf0ImYCnIty6Hsv8vMFIKwqY2rPgEKUaMHY5AG2sRYk=;
        b=QPtaOk1/jjmwn9PsVdnR+G5M6/xjXMOyX0U/OUp7mnXyBAHkBuWhdmpPSrKi5wrdW7
         WJ690VjZwcbKNMANZluIob+pUyD+9w3QObxFVjQE3yxxyHLFQYoIb91sat7UeFde1O5C
         m5kHyoByGHNb3pbOcw0R2ODQ5nIRVfyqAVjRrN3KIZmG3zIgQFtDeKFzRHCuvtGTtvIu
         PM3SdH0y2cHTjfHgEJY4tMMlxZh0g2ex2GN1DY2DkTfo/3kV4NiYk1YixS4O7QAG/TBW
         Lf49WjRfvo99B3dzfJmjbNPnHEdB7GLwNWR4fqjKISO4yxLP4U+VQbtjEA1m4z4vL28n
         KpZg==
X-Forwarded-Encrypted: i=1; AJvYcCVVxBZWRbEjJajxJ31CwEhlb0EDAWCJKVJ3bad5k7R+e6DVWZ9u/9PhHiEEjj++HNAGlWd6MNAwdA==@lists.linux.dev
X-Gm-Message-State: AOJu0YygBy3iP4h85Y3qsr0XQ4FB+W1j2/TK/SyIlo3DRIGARuc9jC40
	E0P7zw/Q7auxofowa91PKCmUwr4B6+pkaOUse3Tuo24NqDB9YqWYyT/34mhufVJa0+c=
X-Gm-Gg: AY/fxX5uMgwY1H01KnxSFWd3tzlMyAVnkYSn13krQJjiod4V3mvyy9WT/tTZt/p3Rd6
	86uEp+CoTE2UsghRN0Paq8WUJaKguPSHAjMRQIdRq9AqIWwfmY1rS5MdVMmlW76DMolBnZ2+N6q
	MEpKPU098ljIAU3KpNQX+eHA076k8moXj/xIbb3ETkZn5mxzIvi/IdvFNJuGImD3lWhgGUvABO9
	FRpcze1mim8u2uigX0PbXDhq8urc5kqHWNGBD5RuNnYafMzdEZvodUAsM22ERxDsOcdkh7Dkl/O
	T6ue6nSyb6ySeMBcYlMs28jokHtR2NT52s0+1iCXcSMXJWmJs5yxOlgMmItgIcqEQD4C7bcG/Dt
	f65j1oc16bhW/vuVpYkBFFfG5MyxN9CrJNsjGjjl4kynJYorX4eFltjoqnNSFkFim5LNw9kUtAw
	wqarqJvPAbpMJGYBoVyGT2cI1wq99I/VzWnDzJd8rrs+dbBDp1AvM=
X-Google-Smtp-Source: AGHT+IESCa7TzSgsPFxRQ8nOnf1gW1Aedmg8uL4v5ngWrg3XKHmo91iY/SWKPTEaWsgBtfXN5+6Jow==
X-Received: by 2002:a05:622a:588e:b0:4ec:f6ae:d5d9 with SMTP id d75a77b69052e-4f4abd9768bmr44575641cf.39.1766158090847;
        Fri, 19 Dec 2025 07:28:10 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac62f973sm19054751cf.18.2025.12.19.07.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 07:28:10 -0800 (PST)
Message-ID: <ee9ce749-5ee4-41d9-8d1b-7b3b507b2217@riscstar.com>
Date: Fri, 19 Dec 2025 09:28:08 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Introduce SpacemiT K1 PCIe phy support
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org
Cc: ziyao@disroot.org, aurelien@aurel32.net, johannes@erdfelt.com,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 p.zabel@pengutronix.de, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251218151235.454997-1-elder@riscstar.com>
Content-Language: en-US
In-Reply-To: <20251218151235.454997-1-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/25 9:12 AM, Alex Elder wrote:
> This series introduces a PHY driver to support PCIe on the SpacemiT K1
> SoC.  The PCIe controller implementation is derived from a Synopsys
> DesignWare PCIe IP.  The PHY driver supports one combination PCIe/USB
> PHY as well as two PCIe-only PHYs.  The combo PHY port uses one PCIe
> lane, and the other two ports each have two lanes.  All PCIe ports
> operate at 5 GT/second.
> 
> The PCIe PHYs must be configured using a value that can only be
> determined using the combo PHY, operating in PCIe mode.  To allow
> that PHY to be used for USB, the needed calibration step is performed
> by the PHY driver automatically at probe time.  Once this step is done,
> the PHY can be used for either PCIe or USB.
> 
> The PCIe controller driver that was included in earlier versions of
> this series has already been accepted upstream:
>    a812b09a6b599 ("dt-bindings: pci: spacemit: Introduce PCIe host
> 		  controller")
>    ff64e078e45fa ("PCI: spacemit: Add SpacemiT PCIe host driver")
> However this series still includes devicetree patches to enable the
> PCIe controller (along with the PHYs).
> 
> The patches that remain in version 7 of this series are unchanged;
> they are simply rebased on top of Linux v6.19-rc1.  The first two
> patches are the DT bindings for the PCIe and combo PCIe/USB PHY.
> The third is the PHY driver, and the last two are devicetree updates
> to enable the PCIe controller and PHYs.
> 
> 					-Alex

Yixun pointed out that I neglected to provide a summary of the
change history in this message.  Here is a link to version 6,
which summarizes prior history.  My explanation for v7 indicates
what changed since v6.
  
https://lore.kernel.org/lkml/20251113214540.2623070-1-elder@riscstar.com/

He also said I neglected to add Neil's Reviewed-by tag, which
is true.  That is here:
  
https://lore.kernel.org/all/ba532f8d-a452-40e5-af46-b58b89f70a92@linaro.org/

Sorry about that.  If requested, I can send an otherwise
unchanged version 8, but for now I'll assume that's not
necessary.

					-Alex

> Alex Elder (5):
>    dt-bindings: phy: spacemit: Add SpacemiT PCIe/combo PHY
>    dt-bindings: phy: spacemit: Introduce PCIe PHY
>    phy: spacemit: Introduce PCIe/combo PHY
>    riscv: dts: spacemit: Add a PCIe regulator
>    riscv: dts: spacemit: PCIe and PHY-related updates
> 
>   .../bindings/phy/spacemit,k1-combo-phy.yaml   | 114 +++
>   .../bindings/phy/spacemit,k1-pcie-phy.yaml    |  71 ++
>   .../boot/dts/spacemit/k1-bananapi-f3.dts      |  44 ++
>   arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  33 +
>   arch/riscv/boot/dts/spacemit/k1.dtsi          | 176 +++++
>   drivers/phy/Kconfig                           |  11 +
>   drivers/phy/Makefile                          |   1 +
>   drivers/phy/phy-spacemit-k1-pcie.c            | 670 ++++++++++++++++++
>   8 files changed, 1120 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
>   create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
>   create mode 100644 drivers/phy/phy-spacemit-k1-pcie.c
> 
> 
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8

