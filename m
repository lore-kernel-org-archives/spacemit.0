Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0D7435ED4
	for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783699303; cv=none; b=ZoZNe5ihmdectVY9hnvlyEQ8yhvMXD6B7OkPtJLS+Z0q/H6GiM0EcGd+fD0zMN4BZlI75nSXQDWiqPOCJjs/K00wkVrCOsPvwSni+rn+dIrcY4nfFUekXRYmcoAX0qappIOch5QwkBrepa1/DTGQrXRaDGB8l5YBhF1GIU7Rj+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783699303; c=relaxed/simple;
	bh=VwiAZXZIJdaH4H2GdoTNqGdH0W6/6abMGB1zwC68+H4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zv6LQxXP6Z8py40bNhlQ4CHXBOUlvS/x0mKC/Zwjr1rrjsm3RYaB8Om3U+jrpQOgSon0JPhgD2Y1/VYt9VKH8OkUT2YGiJjnrQFBNuX1E+nSwK9ZWpdVEF4LaDOavfHcqqE9sxJjA6KI/Zpw3g+qRbIkWHCb4He8xrpQprXazik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=YI2ehmgS; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="YI2ehmgS"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8efcef23d21so8953466d6.2
        for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 09:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1783699295; x=1784304095; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBrb1/xcTqbJkDmBUM03GUxf19wY42RaKRfKCOCo/XA=;
        b=YI2ehmgSDijHYzrYzasBoHLDNuOdBBVB2CGIhgE504qY6NO3A3nt5qlf3nqQik9J24
         mlU6igLvg1+Z0YJGBodm/LeldabYgW/AU4xuGUkwnNmZGA8rqQDWJUWaGKvkOxKCd3X3
         bEy8SfNm7qK1IKC4ap55jsvEuRcVleN3+COaWfZQOlCpkqBGmzMZC6SmZkzVGNyl4KHu
         m0nYzrvkYzy5G/88yENnwCDxf0eTyBULl4pkXojgPzDsixPDrPd/bYR1Vl9liyktGCmQ
         bnX3Opr0NwvQ3IFvi/jUkHHideFq2QN2QuoZU1OfeSDEWa8DBnNTaLQbytujkApZlf/y
         nqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699295; x=1784304095;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mBrb1/xcTqbJkDmBUM03GUxf19wY42RaKRfKCOCo/XA=;
        b=KFHwt5xGxpScQ0NBJZj3BUnuUCapvuJjzU6ofMgY5lvBMOPg+IIy9oz2TOBqlL0KTo
         SAeTr243qHAmF0aabbmW9U2lkcSKJfYPqLdF24i6vsGCp5Z86E9YZyejSh9B4LY1q/WO
         bpn0ybF4bUIvX5N6qaA/s9BDP9KuER0u3sPdYFASpaH1HEo/MMAla7M/CvylnDCqlCNl
         S7XN3FZc7tTUQRJcXl/1Im6GoSaJf4KLVw4itnHomP0RgAxFzcikLV0Rf0L1UTgE0eOD
         gCKODm8VcVsWOeNhPRatHh4p48Qz9Zkr4xo/+9z5eyLy17MaXRqiYNmTjcGUauRx1JeJ
         G6/A==
X-Forwarded-Encrypted: i=1; AHgh+Rp02BD/7QAbD8ux0UdQx2GGRXp9TOKOOjqloJ0ZsFqOoVaEy/XtOBkk6tW3Jvzu94xc0hEKdXZGuQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZS17c5uOuQpYXa7afUy7NjcC0BT3w9nHyqN5HFIHVjduTp0Sh
	/GBxbP2+/ZJviErH3hf5HRI5/JBtlOa20cKqtp00YyISaRm9Ia7PuDcCSOX9b4GFxZM=
X-Gm-Gg: AfdE7clo+0Abz9nMGnHKEKPQaYFi+BDMG/RNqmNMllAHLAr5WS2A62v8WuNXTraw3IX
	hoE15bo5QgCxZSTYZigvV9mPYi8iRLhry6uvsKHJK2c14g1LHUQAFPMyf2fOu06p2eyNDj/xHZY
	yCU9SUKGRe8U05n3NuQWvskeXdJguA/GLriGhSt32b0ye7VyEqLMOgV2RSjClQdmxip86+SGmqO
	ixMX4iMT3kxKKGNuq+kdXsWAfOo9fj/DeREhEpDwxIPXMZHQWLWGanJo7Lhxe8tglZLK9nlCQD3
	gEHNrrOjG2lQePa1d+h//lzBwb7zAVWanMHzjinn4P1yjcMFp602di85XElUejicZEMjdz/v519
	a5B3d8kZO2oSShqAJHcJdmgMFuOuD16xdqCJtK032ccG6wEgLZaKQ2axy5aTxwiAi5XYIza0iY6
	VD3JW49hnYQq0b
X-Received: by 2002:ad4:5c47:0:b0:8ef:8e79:bb51 with SMTP id 6a1803df08f44-8fec2279f84mr159256126d6.40.1783699294772;
        Fri, 10 Jul 2026 09:01:34 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9036e27f765sm8965376d6.11.2026.07.10.09.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 09:01:34 -0700 (PDT)
Message-ID: <79888a39-ac3c-440a-9299-582066868140@riscstar.com>
Date: Fri, 10 Jul 2026 11:01:32 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] dt-bindings: PCI: snps,dw-pcie: Add msi-parent for
 MSI handle check
To: Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Christian Bruel <christian.bruel@foss.st.com>, Frank Li <Frank.Li@nxp.com>,
 Nam Cao <namcao@linutronix.de>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Xincheng Zhang <zhangxincheng@ultrarisc.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-5-inochiama@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260709040027.958400-5-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/8/26 11:00 PM, Inochi Amaoto wrote:
> The IMSIC device on RISC-V based system does not require ID
> remapping for MSI. So this device only needs "msi-parent"
> property for IMSIC-based SoC, and the "msi-map" is not a
> necessary property.
> 
> Add new condition for MSI handling on IMSIC based SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

I have nothing to add here.	-Alex

> ---
>   Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
> index b3216141881c..91bbbc8924f6 100644
> --- a/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
> @@ -27,8 +27,11 @@ allOf:
>     - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
>     - if:
>         not:
> -        required:
> -          - msi-map
> +        anyOf:
> +          - required:
> +              - msi-map
> +          - required:
> +              - msi-parent
>       then:
>         properties:
>           interrupt-names:

