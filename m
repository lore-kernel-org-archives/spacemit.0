Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3157836493D
	for <spacemit@lists.linux.dev>; Mon,  2 Mar 2026 13:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772456952; cv=pass; b=VhFU+Gjw8GneOjJ5FDDheccdYJZJOBPixFyz8BEteXFH7SdQAJSJ5eIx65cQ+ucIQwMkCaKmzpFhL+DLmkvmfGyiFzvVig8xFc2TrY4lNLsESiqsfG26lwaYGfqWssb96MmGmWefs0DpLqSlskhu7H//h205F1zGmhEhATN6hQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772456952; c=relaxed/simple;
	bh=AXkmsR7ZBoHxpbOwLmqOU+xWVUc36k5CuxoMdy/D9aw=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u5DYgp8g7IKhs81FMLFJr97EAwp1pFPtsDoJh1Dh6MJyjWf0w6GkIo8oRo+fieO40D5lQiSH4PqciC2LMyIP54H8eM0cjzwux7UIc7qiDW0E6xrXxrSxuX+KJ0g0oYf3IC8GifAmvhnyCvyhq6qnH7NegcB/AjRfDaiRwDK4s6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=V0oqPwpg; arc=pass smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="V0oqPwpg"
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0DBBE40140
	for <spacemit@lists.linux.dev>; Mon,  2 Mar 2026 13:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1772456943;
	bh=/ECnSn+s6d8RzhavbIFJQEnGNDdcB3vQZ0KecCsizik=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=V0oqPwpgSX8HMYdTNuIHFhencAcdIT/Vvcso30FXPH+rrOfpzxXCR0nMHjO3m1xBk
	 nMJhM3amfo6T18tbwbaE3+b/i/jOz6j8qcueV33lCG1Good3C2/aaI0vYY5rIRcLLw
	 lkVsw4VCDb7q6StqlO3f0hgzvZvZW9z6UxZZqMnpTbExBTvsitgs8jj6mUiWNKJ/UR
	 r02blw9yqAreL9OMOy4J22N6YYnQH9b/mdB4Dm3oTyDV+6AUN2iW3JHGOPWKV16ouB
	 8sCCNQ1qEje6Fwpkq3X+ULJPFM2nUiBvTT1UQbEWmaR7QTKUOu3wxkkZ4NpuI9Nutl
	 ySfNJj2rYYvjEC2UBzHc2ecmS/IcLdCilD+qyHML+rAkkr7C55OkCGmRRTdm1NfVck
	 +bEHOPTUK88dk6rtxefAUQf4eFv3nd6N6/qnDGakTSippuFCPKxv2rFhfJsikX8naL
	 8xZJ6H2MgeUSidQRNrVznGbtQUz47WH3B3cIlECRbhBWexrP/XkKdbOxEKlZjN+j5F
	 x8Rac5VRVxdLkV7tDRejKVc8M6Dy+4Egb4qhKubSRQ+3PxDQZFNpw4bqF+wVvf8YQa
	 CJKQNHWxEn25rbicGdj2jSMQ9UDgAn1CGsQKcKDE8SO47NjySk1zDnHw8ZHmEJVURs
	 p6C3tTo8RMWXKddAVxG60QnU=
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b936b6b4473so418882266b.0
        for <spacemit@lists.linux.dev>; Mon, 02 Mar 2026 05:09:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772456942; cv=none;
        d=google.com; s=arc-20240605;
        b=GGE1K50te3ERmx7hLZpyVWHBc9vsZSBfqZWZgq9SAQapYK5dXrB7usW/R7UEqIl8Vu
         wMMw0qsPyZgg+m9R87oTa07IqCAVgIdPJCsStKuNgIE9hkrCS6kz0Ulr7bSihlGudMNj
         8CvR5ORQ9F79H0D2X1AjukoTik9E1i4dwpH3tAnmvxV3NdtBPapJCcoeo9AYp84Bdp37
         ebyA9wI1WGfI4ujN9nttL6AtvcGiGndERNFLmTJ2+QkAVkH6JauUJu0yu9ir1oKOc9r+
         6xlcOAs0pKC/l2N1Nk2pbI7jJuK5+8QfTjljIrkAFVfnIwi4/OhNhls5puf+zh9dgH0w
         2yvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version;
        bh=/ECnSn+s6d8RzhavbIFJQEnGNDdcB3vQZ0KecCsizik=;
        fh=fM42649Tcc4KfdX/rgb3/5LK6pfWQSWJFFxnS6GmJNI=;
        b=cTXtxaIP/vzIbRaePQ7hoJnxtu+SOjBbQbSjZqQ85KGwgU06AiwK9lWlWEn5oc8Ax7
         95jceCNI6cUQxbsNO5DsbJqIxazjufpzB5JRygsyTuLGN4/IFoJf2nCdkuzpMVAzENJC
         zFV0t+TvKZW5fjtC16RPEVrU8wzKQoS9fS1GQ8y8VsX0RBJWK2/r6GvLj9upuU9XXbGJ
         Mq4j761jI2QWES0DH17hS3AWRZfGhkCB16sT1u7gxlISMn03ic2AbG/KiRhQBmY0aFOg
         v4JQzh5ajJ/w21X66Lzja1vXqTYXymbfP6fGFdnLQYZIefknMywFDTGQlAs/EpjX0Alm
         FmOw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772456942; x=1773061742;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ECnSn+s6d8RzhavbIFJQEnGNDdcB3vQZ0KecCsizik=;
        b=p0tQZZNoc0RN3n3X8HQLMpAXorUBKSQ5F0lmPoz61Pqkn0SHUum8RAfNdP9SptsqMC
         E1IbLkV0E2jsxHFIIxhXDqvG9EsdKPAl2eN0E6srJ1AwU2cEVdiEzLvm/aLrUz136zaW
         rongm/DxnFEuOtQ2NdaQnqx3kz5WK0o/1Wbzk9Wb2bQJ9j0ehPzycaU/9T5Cjj0HDPMx
         4AQaMKnJUFPjNSZ+hMqdqA+PCmonHyUXM1w4PcgXQ99yMfzD030nvTRClVbe0ysQj8HP
         2rDPt9okvwLIDRq1hUvYadO2HTEVSzfSeNCuyngwsPbH+/c1aa0mpNI0TEZOy3LQ5ACO
         H0FA==
X-Forwarded-Encrypted: i=1; AJvYcCWsgp+6q1SbS7j8YM9L2Zi9mNHYtBoQgg5NRrKoOdKk7Q7hntp0hqEzK0dhWoEVC6h36+Bt1din5g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz632+qr9ESuHV/xN165S7Oj8nHAJbi9UkTtQag/8+FBPA3ZOPl
	BWJchozsH3l9fxhab1pl+kLOmq/36maziZTF7H01PHWCAhkHTo4sHAG7b5UXkgTAnPd3KNGZiJJ
	yz8spU61mbS/doC5E1T5gjESY4UwHxVClzxNkNOLukjXjFJbXL57bmXnYDTRura3nK8/29ZYyFz
	ZuJtemueiKzbtqqolVd5FyDjcMWwiI67g5QzNx2lzBZmiCL9z4zZc=
X-Gm-Gg: ATEYQzxL5LkDz+f4tVCPvilM3/YEQU7vdMHRtMnHmsvBvBqNdZHxfDtgnHCYx+KdrrJ
	Dt/HnRtu/zSiMgLJPjmqNBBnRJrSoEPkADA0qEfPkmf6iE8oqTuNl1FT8LPEYIpYRZbTR9jV5Vy
	d9bri/vMletRCrs9Js+Wx3/8itMFBKTpb4pyjlAylzLtIerdgZ0G4sSpz/OaFi28+vuTH+d3PWb
	hOk
X-Received: by 2002:a17:906:9fc8:b0:b87:efa:8786 with SMTP id a640c23a62f3a-b937657d99fmr789095866b.55.1772456942103;
        Mon, 02 Mar 2026 05:09:02 -0800 (PST)
X-Received: by 2002:a17:906:9fc8:b0:b87:efa:8786 with SMTP id
 a640c23a62f3a-b937657d99fmr789091166b.55.1772456941578; Mon, 02 Mar 2026
 05:09:01 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Mar 2026 08:08:59 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Mar 2026 08:08:59 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260227075718.2243818-1-inochiama@gmail.com>
References: <20260227075718.2243818-1-inochiama@gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Mon, 2 Mar 2026 08:08:59 -0500
X-Gm-Features: AaiRm52b-jdW2UNX8CSDWuKrreJ-aGAWnKXn668LfKMnXa2Ks1b4qAF3c1WKw8E
Message-ID: <CAJM55Z_soPhC9P03edfq_A-GN07PbGqu31aHgE_5kKhkQwkMmQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 0/3] riscv: spacemit: Add ethernet support for K3
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Choong Yong Liang <yong.liang.choong@linux.intel.com>, 
	Conor Dooley <conor+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Richard Cochran <richardcochran@gmail.com>, 
	Rob Herring <robh@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <me@ziyao.cc>, Yixun Lan <dlan@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Quoting Inochi Amaoto (2026-02-27 08:57:14)
> Add initial support for ethernet controller of the Spacemit K3 SoC.
> This ethernet controller is almost a standard Synopsys DesignWare
> MAC (version 5.40a). This controller require a syscon device to
> configure some basic features, like interface type and internal delay.

I don't know how we can accept this when it can't be tested since it still
doesn't come with the device tree nodes. If you don't want it to be part of the
series, just share a tree where this code is working. There are plenty of free
public git hosting sites available.

/Emil

>
> Change from v4:
> - https://lore.kernel.org/netdev/20260130022705.1059214-1-inochiama@gmail.com
> patch 1:
> 1 Apply Rob's tag.
> 2 Adjust clock description according to Russell's suggestion.
> patch 3:
> 1. Add set_phy_intf_sel() and get_interfaces() hook, suggested by Russell.
>
> Change from v3:
> - https://lore.kernel.org/netdev/20260128072931.875041-1-inochiama@gmail.com
> patch 1:
> 1. fix the uncorrect compatible string postion
> patch 3:
> 1. add "CTRL_" prefix to all ctrl register definition
> 2. only use delay config 0 to calculate delay code.
> 3. fix typo in the comment
>
> Change from v2:
> - https://lore.kernel.org/netdev/20260121071315.940130-1-inochiama@gmail.com
> patch 1:
> 1. remove not needed compatible for select
> 2. drop empty line in "spacemit,apmu" properties
> 3. add spacemit,apmu properties to required.
> patch 3:
> 1. remove misused phy_fix_phy_mode_for_mac_delays.
> 2. use local tx clock instead of the clk_tx_i in the dwmac.
>
> Change from v1:
> - https://lore.kernel.org/netdev/20260120043609.910302-1-inochiama@gmail.com
> patch 1:
> 1. remove phy clock
> patch 3:
> 1. improve comment and include something special about Spacmit K3 dwmac
> 2. reorder the included file
> 3. fix wrong delay macro used in spacemit_dwmac_set_delay.
> 4. add check for maximum supported delay.
> 5. use DIV_ROUND_CLOSEST to calculate best delay configuration.
> 6. use assign for the ctrl register initial value.
> 7. fix input when calling of_property_read_u32().
>
> Inochi Amaoto (3):
>   dt-bindings: net: Add support for Spacemit K3 dwmac
>   net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
>   net: stmmac: Add glue layer for Spacemit K3 SoC
>
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
>  .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 226 ++++++++++++++++++
>  .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
>  6 files changed, 345 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
>
> --
> 2.53.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
