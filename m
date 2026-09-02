Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B554D431E5E
	for <spacemit@lists.linux.dev>; Wed,  2 Sep 2026 10:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.128.198.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343901; cv=none; b=IkREmVD3RmKLuRaOWeVSqP82WnZ6vmiVQ7nElNZNr1ukssr3+7x5tghlm0BO42Dq3M0pS4854VtITs+hNLKDxqbFPthUdXl7WKH+UKUwzkMlUc0vO1bEfnfCr1RYlHCjZVuxmAtXT96t9X3Na2vbasno/v3xV9N/P4woyKoYeag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343901; c=relaxed/simple;
	bh=NaUMWOkmvqHx2SAeXBZ6E4hS/R5iElAvvNMbKjghopE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atthakNe03kKAH8I/Jv0ysk31u8fGw1XjCIAxYVucez+y+Og8PkvZkNDPd9H/xmlLZke+7Ex7v9RRvwG3gZjwjYirrGioqLsYQ4TeCAIlHjx+uCzcYj/1DDkO1TU3+Emj6w2puvW1CPRDdVUsJtec1iWmiWF0RHQj3LU+1NI35A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com; spf=pass smtp.mailfrom=andestech.com; arc=none smtp.client-ip=220.128.198.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 6829ub7r074751
	for <spacemit@lists.linux.dev>; Wed, 2 Sep 2026 17:56:37 +0800 (+08)
	(envelope-from tim609@andestech.com)
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6829tX54074367
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Sep 2026 17:55:33 +0800 (+08)
	(envelope-from tim609@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.43; Wed, 2 Sep
 2026 17:55:33 +0800
Received: from swlinux01 (10.0.15.55) by ATCPCS34.andestech.com (10.0.1.134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Sep
 2026 17:55:32 +0800
Date: Wed, 2 Sep 2026 17:55:24 +0800
From: Tim Ouyang <tim609@andestech.com>
To: Yixun Lan <dlan@kernel.org>
CC: <u-boot@lists.u-boot-project.org>, <spacemit@lists.linux.dev>,
        <u-boot-spacemit@groups.io>, Lukasz Majewski <lukma@denx.de>,
        Tom Rini
	<trini@konsulko.com>, Junhui Liu <junhui.liu@pigmoral.tech>,
        Raymond Mao
	<raymond.mao@riscstar.com>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        "Peng
 Fan" <peng.fan@nxp.com>, Torsten Duwe <duwe@suse.de>,
        Ryan Chen
	<ryan_chen@aspeedtech.com>, Jonas Karlman <jonas@kwiboo.se>,
        Alexey Charkov
	<alchark@flipper.net>, <oyst.lnx@gmail.com>
Subject: Re: [PATCH 6/8] clk: spacemit: k3: reduce clock tree for SPL build
Message-ID: <shthcaz5wjcp2vwd2c2i74axiayf4zhlgsoq5fbswofld5poq4@znfx5b2yby2t>
User-Agent: Mutt/2.2.12 (2023-09-09)
References: <20260825-01-k3-clock-reset-support-v1-0-c430253e759c@kernel.org>
 <20260825-01-k3-clock-reset-support-v1-6-c430253e759c@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260825-01-k3-clock-reset-support-v1-6-c430253e759c@kernel.org>
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6829ub7r074751

On Tue, Aug 25, 2026 at 04:24:16AM +0000, Yixun Lan wrote:
> Due to SPL image running in a memory space constraint SRAM environment,
> so reduce the whole clock tree a bit to make it fit for final runtime
> requirement, only a subset clock tree is registered, which includes UART,
> SDHCI, I2C (TWSI), and their PLL/MPMU/APMU/APBC ancestors; while the
> full clock tree is retained in non-SPL build.
>
> Where surviving SPL CCU definitions reference parent clocks outside
> that subset tree, it will use "clock-dummy" as name of clock parent to
> ensure the framework still successfully resolves the parent clock lookup.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---

[...]

>  /* APMU clocks start */
> +#if IS_ENABLED(CONFIG_SPL_BUILD)
> +static const char * const axi_clk_parents[] = {
> +       "pll1_d8_307p2", "pll1_d6_409p6",
> +};
> +CCU_MUX_DIV_FC_DEFINE(CLK_APMU_AXICLK, axi_clk, axi_clk,
> +                     axi_clk_parents, ARRAY_SIZE(axi_clk_parents),
> +                     APMU_ACLK_CLK_CTRL, APMU_ACLK_CLK_CTRL, 1, 2,
> +                     BIT(4), 0, 1, 0);
> +#else
>  static const char * const axi_clk_parents[] = {
>         "pll1_d8_307p2", "pll1_d6_409p6",
>  };

The SPL clock subset does not seem to include all the clocks described
in the commit message. For example, the SDH0/1/2 clocks are excluded
from the SPL build.

Is this intentional?
--
Best regards,
Tim Ouyang
