Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E372D9795
	for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 16:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760718058; cv=none; b=t+2bF5KIAhCTr+BgbqCqcgtcT3wqfa3IFHkpLNEaLIT3CAj7xIOwPpurx/iQUwUF4aGccna5GpnL3VCs5JiML/zSPoTN88/Oos5/DDEn6CFby+gjMIhZDV6Vb3qtEugtP06nniuTcxNSFY7FwWiLQ6DwnQ8+HW1Jp+C8+SKitRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760718058; c=relaxed/simple;
	bh=1MZ2AU1WSg264AVMPFKY6li+ENJlJqRj4V8LnjhTA9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eA18ES+NvCe0jRWXayILi3juNuli+QHjLYvQkHfM6rhWxmXDxcvJtkESkU47nJD8MG9cFb6IMdR6ecqDVbHFHqK/BAZsHnYq1o7kGoycRUPH2E1HOa6+u03xAy3ECYO6OEd8UbTO8eclv7A1QZ0ywDK5nanKnX+7IsDN5yOwfRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=KwhNjVd2; arc=none smtp.client-ip=209.85.166.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="KwhNjVd2"
Received: by mail-il1-f195.google.com with SMTP id e9e14a558f8ab-430c180d829so7647595ab.3
        for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 09:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760718056; x=1761322856; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kq4xC/ePley+c3+EpvbCqMrUnY6wr0uXkN8/DbkCipg=;
        b=KwhNjVd2trXen727scaRwH8ldXOOF2zTWpaU0RC60nt+bg+wVolS1dNmmHSVRTgxiX
         QNvRtEB2sQUoIr82gCBa6cu60wM4vIvzOI141mkoPdQLKvFb+ZPdKMbb0mO0synwHWhl
         ZzfvJ9JUj4Ve3OonX6WDu2cmYykhsLJmE2t54XP5DrKpqK8XgkYxPS3IxCVwJun7Gs0E
         VjqBH9E40jNChzx1K4+t1t89Zdvg7aJZWZsNQZcRZIrS9DZlzZpR2EmgeZgKs7c7aXIp
         u/L8dy1yZ5isvk7XXt4KD3lfhlppXc6nX4JYZZoqprgv39XiDyRKRnJlPmgBHpVhGd+x
         3W/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760718056; x=1761322856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kq4xC/ePley+c3+EpvbCqMrUnY6wr0uXkN8/DbkCipg=;
        b=HnI2a1NhZUyel033A8fG/6cCfRernIXfomNgZPxvH9JYC9bjcnuWBrLwjqxK0+Heyn
         rorjqJkxOIZCAeH77YMdJvSg/E4sWahbkvQyLCQEit34Kf+k6MYSn5IMddUiUbVNyx5E
         6Yhd0SenDiOUoOSckwyFFZZamL3PHn6o5Bexj8T8BqVPvXjv60IPsNPJOt9MZCSrdkpo
         2gTnMlowzHgHumgblWWroArnSdpeU4RQw6fI+kCKP6D5JLWnzKbdkhH+p2iELwTFE2wc
         wkDXed+PBQCoOb0sCuhL7gdVx6CflxMIuynSXNkrSeEbh5UDR3dq+ie1mSyuMdIkWfx7
         oyVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+jiUrY8anNkk/U012iiq3CUU/e2k4xVSebkTqHUA5Q2leyeWoi0oqG0bsACdzx189Q5BrcmOMkA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6jaRXhKyeA/zxaopZgUanoE5PMsIZZiShkHe+vH9Ye3owkf+w
	jF6+y9RXM5GGgVAVcpGQUudyLt6zTHJzVdzucHKdafS/pW5zqXsUyiYW0N08vKFCDf0=
X-Gm-Gg: ASbGncsdhMvavN4RglFwuvq3hzB6GTyGxAace2IGYkiCer3UNjWDaymHliDFIJZrHJA
	ebZVUIJJ1m1yl7os+NWCkm65C27QD10AuWRVdO9zsGUZXKcrrASZ2uJkEw68P8bzYNTnnrIt+N8
	+Yo2dH5KOr2NRZzq+6APTXMZ2aVZSbdB3DOA/NzmzZdRdOThyiRWDtn4ZpYoMzEPVxZwOYoCvHh
	du9LmXgTrfRmPG/RwibegIPrrkuB28Wa03JsKKh8KZs6lfakeNvl5qf4GWeCePkYCSRkEkCq9n3
	k2uNZi0Jen3BIsRczePHWT6S72oy8T4WL1TSiia/etxDqszCVNjeCAYEOjBrpTeGmtwGhz34SNm
	vMLn5RjAdH24Q6FnMjwcob6am2T2x5OCjE4Z2HZKq/YVyjg2c2iuUhH0q9Ppc2ffaXww8SSbtM7
	j3aGE298N+849NrgykueKpG4B5TDJsdjOIWIUzIDGd/deaEn9rXA==
X-Google-Smtp-Source: AGHT+IFTra9R68sarPEZ7JGiGUxqA+JBh5gKP1pY4jtUAbRv4g02dpfpSvuUEN/4DBcwJsgAfUmRPw==
X-Received: by 2002:a05:6e02:2307:b0:42f:a60a:8538 with SMTP id e9e14a558f8ab-430c52b5afemr49210015ab.16.1760718055789;
        Fri, 17 Oct 2025 09:20:55 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a962f04fsm22836173.21.2025.10.17.09.20.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 09:20:55 -0700 (PDT)
Message-ID: <72e30269-a7e1-4f34-81ad-9026ef95ddd4@riscstar.com>
Date: Fri, 17 Oct 2025 11:20:53 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] dt-bindings: pci: spacemit: introduce PCIe host
 controller
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
 <20251013153526.2276556-4-elder@riscstar.com>
 <20251015164730.GA4032812-robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251015164730.GA4032812-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/25 11:47 AM, Rob Herring wrote:
> On Mon, Oct 13, 2025 at 10:35:20AM -0500, Alex Elder wrote:
>> Add the Device Tree binding for the PCIe root complex found on the
>> SpacemiT K1 SoC.  This device is derived from the Synopsys Designware
>> PCIe IP.  It supports up to three PCIe ports operating at PCIe gen 2
>> link speeds (5 GT/sec).  One of the ports uses a combo PHY, which is
>> typically used to support a USB 3 port.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: - Renamed the binding, using "host controller"
>>      - Added '>' to the description, and reworded it a bit
>>      - Added reference to /schemas/pci/snps,dw-pcie.yaml
>>      - Fixed and renamed the compatible string
>>      - Renamed the PMU property, and fixed its description
>>      - Consistently omit the period at the end of descriptions
>>      - Renamed the "global" clock to be "phy"
>>      - Use interrupts rather than interrupts-extended, and name the
>>        one interrupt "msi" to make clear its purpose
>>      - Added a vpcie3v3-supply property
>>      - Dropped the max-link-speed property
>>      - Changed additionalProperties to unevaluatedProperties
>>      - Dropped the label and status property from the example
>>
>>   .../bindings/pci/spacemit,k1-pcie-host.yaml   | 156 ++++++++++++++++++
>>   1 file changed, 156 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>> new file mode 100644
>> index 0000000000000..87745d49c53a1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>> @@ -0,0 +1,156 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: SpacemiT K1 PCI Express Host Controller
>> +
>> +maintainers:
>> +  - Alex Elder <elder@riscstar.com>
>> +
>> +description: >
>> +  The SpacemiT K1 SoC PCIe host controller is based on the Synopsys
>> +  DesignWare PCIe IP.  The controller uses the DesignWare built-in
>> +  MSI interrupt controller, and supports 256 MSIs.
>> +
>> +allOf:
>> +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: spacemit,k1-pcie
>> +
>> +  reg:
>> +    items:
>> +      - description: DesignWare PCIe registers
>> +      - description: ATU address space
>> +      - description: PCIe configuration space
>> +      - description: Link control registers
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dbi
>> +      - const: atu
>> +      - const: config
>> +      - const: link
>> +
>> +  spacemit,apmu:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description:
>> +      A phandle that refers to the APMU system controller, whose
>> +      regmap is used in managing resets and link state, along with
>> +      and offset of its reset control register.
>> +    items:
>> +      - items:
>> +          - description: phandle to APMU system controller
>> +          - description: register offset
>> +
>> +  clocks:
>> +    items:
>> +      - description: DWC PCIe Data Bus Interface (DBI) clock
>> +      - description: DWC PCIe application AXI-bus master interface clock
>> +      - description: DWC PCIe application AXI-bus slave interface clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: dbi
>> +      - const: mstr
>> +      - const: slv
>> +
>> +  resets:
>> +    items:
>> +      - description: DWC PCIe Data Bus Interface (DBI) reset
>> +      - description: DWC PCIe application AXI-bus master interface reset
>> +      - description: DWC PCIe application AXI-bus slave interface reset
>> +      - description: Global reset; must be deasserted for PHY to function
>> +
>> +  reset-names:
>> +    items:
>> +      - const: dbi
>> +      - const: mstr
>> +      - const: slv
>> +      - const: phy
> 
> You expect/need the phy driver and PCIe driver to both reset the PHY?
> You should do that indirectly with the PHY API when you reset the
> controller.
This was previously called the "global" reset, and I renamed it
to align with one of the existing DWC "app" resets.

I put it here because I had the impression that it was required
to be deasserted for both PCIe and the PHY to function.  Currently
only the combo PHY gets and deasserts the PHY reset (for the
benefit of USB).

Instead, I'll require this global/phy reset for both the combo
PHY and the PCIe PHYs.  I will get it (deasserted) during probe
for all of them.  Then I'll remove it from the list of resets
required/managed for PCIe ports.

I'm going to keep your Reviewed-by on patch 2, even though I'll
be adding "reset" and "reset-names" as required properties.

Please tell me if you'd like me not to do that.

Thanks for the review.

					-Alex

> Rob

