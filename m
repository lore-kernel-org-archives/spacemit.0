Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8389A3314AE
	for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 11:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599343; cv=none; b=nm6LyMykLAdUiR1ClJs007gT4NQuIJawIg/Rq1/mMIj3ptMID4OaML66B916NV2TcDC/tpGZ4W27kjVlon4VSu27ro7h+pzlMTq8oOOSv4I32ps2n3ecvXMcZ06oKmSbRYKDV8B7Shd/cdD4w3pmyuTmEHxt1lUTyixVQXNCrHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599343; c=relaxed/simple;
	bh=XNI1PdxzUMCdX20UCO6iHB0ZsB5uIDvd2qbamyYZI5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8+JFOnqTvKi4lX0PB9+HSeQf8VmDC/6P2ojGTZ3DhjniijV/h3snLT4K8msNJOwSKjCVgAl5LL7s7aqPbNDsAAt/cQ7Oeg9eJxALmAw024BzuTbIIZkAxnZb4q6Bx7/yMErUaJg5mK72R6oVxmZyJcrG3vJWJbRpRwh2md0Qus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sk/8l9JY; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sk/8l9JY"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-124a95e592fso325506c88.0
        for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 03:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769599341; x=1770204141; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QJUI8NJKVSDnIT+QSuw3y5qsdf/HcwP4R02WUPv/Zns=;
        b=Sk/8l9JYsrgm20Wng3cfQIybgIL3qgUNrR6iox33wOlIFZKRqeFvqUoBMeb+P6voM3
         3LWCoqpGCfHRraWDRHRI1PvzP/K3jUMf9c562Ozoe3U7zE4EvO7x7JTfzVMuDqueMMv5
         fLE1raQ38zVeLXsnWtuNu0gKh4pVKKZF8qeC0/vNHS90iStw0aYpGsBmPe/OXDMEvGK/
         w4W+EizBtorKNjC8Hco71xLLagsMNnKSllYeyTctc9NnJG1/TkKL+xKxVYru0jX916gW
         MrBZg1wi7LR/JhU2wjM3VRG7to9qNJMLFuCUqz0Cx3gIkm0GmXHTa4q8G+w27DMHtk7v
         8lGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599341; x=1770204141;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJUI8NJKVSDnIT+QSuw3y5qsdf/HcwP4R02WUPv/Zns=;
        b=e+P63Q0UbyVjaul3homJs0LDZ6ZuAoVM+LIV1OkqGwqX1Hti7SQa4A52hr0dF9Zacg
         9P+7AJqtvIfFN9bTKtMisgZky8SwBM+qkFqiUw2tkTmUQLA/e2whebSAZFYwtrh0Um4s
         LO9eYA+14fHdOdbAig5xqjopqRyp6mQc/LaD6+5nLM7WJGhDbaIKwtRicVUzWa1m+xle
         o/Pv1cec3zJyHkIkjB9qxlZGnWgB9xM8UA6netJ0A/MzH8Rc9SUSqn5aTF1lIVdEng0+
         kqQamiU9v9pWCC7R4hVjsKILlKdFCSwHANgyxoWS0jCDcWe9cSIAyRevzPAlYEQV6Ybf
         A3Zg==
X-Forwarded-Encrypted: i=1; AJvYcCWrG3SnRojTkF6Z31zqeo+PDZq7BKPCcWjjzNuZidByoepj+1ORXc4Fr37Bp6hLvK8dv1HlM3ckkw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxkcIfC3ZaaPnPVu6D4CRlUMulyH8C2/DMpve0QXwEugkbTFQIm
	ySQYWm6pLx8+LF7B3ejg7nAGXTzHGHO796Fp/cZ2RAbMm06HqXqtx9Bj
X-Gm-Gg: AZuq6aIMImy8oew+87d7xtQajxVBxw4UcC0K0qF6tf1ucgnO5MTr4vb4gpwQE6z2/88
	x1v+zfbiau4Ia9HxEM3RBtnh2jhSiNh5peNvl4ODN9xi50tHenD9aAoXrz5sCwesQk/+9OKaEBb
	XeBFDBRErD5ZS/wO5X0okVmD4HvRnDX9YPUcjJYau/0REd0oZFd8EZ89tHtc1IJUIdn/0F8f+Rw
	zhbE6C2Niw461rCdo33t3Z6mZPz4QYtcSgmPMcTRBDFBc3V/oXiuCRYoRm2kyWOhW8+Fn5nVTVE
	R3NPxAM3A+LazHCQwoTJICUqhIwOMePuD+QZDW5nZntZx7RW28V6VV3crX8FZuNB3B4XO6uzwY5
	2uhm2UalSo57addPLDXN7k5TqASTRxXtDbgKNmNkTKY+1Z9zlYVcGWiyPZEeGyttiOCO95JEuFe
	syKSRC2uXzPQ==
X-Received: by 2002:a05:7022:eb47:20b0:11d:fd26:234e with SMTP id a92af1059eb24-124a0070cbdmr2385944c88.16.1769599341399;
        Wed, 28 Jan 2026 03:22:21 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cf8d6sm2140833eec.3.2026.01.28.03.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:22:20 -0800 (PST)
Date: Wed, 28 Jan 2026 19:22:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vivian Wang <wangruikang@iscas.ac.cn>, 
	Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Yao Zi <ziyao@disroot.org>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Choong Yong Liang <yong.liang.choong@linux.intel.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v3 3/3] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <aXnxDlExQRYrbf6s@inochi.infowork>
References: <20260128072931.875041-1-inochiama@gmail.com>
 <20260128072931.875041-4-inochiama@gmail.com>
 <f73fc83c-b38d-4974-ba3c-80c5e5556e7e@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f73fc83c-b38d-4974-ba3c-80c5e5556e7e@iscas.ac.cn>

On Wed, Jan 28, 2026 at 05:16:46PM +0800, Vivian Wang wrote:
> Hi Inochi,
> 
> I have some comments below.
> 
> On 1/28/26 15:29, Inochi Amaoto wrote:
> > The etherenet controller on Spacemit K3 SoC is Synopsys DesignWare
> Typo: etherenet -> ethernet
> > MAC (version 5.40a), with the following special point:
> Nit: point -> points 

Thanks

> > 1. The rate of the tx clock line is auto changed when the mac speed
> >    rate is changed, and no need for changing the input tx clock.
> > 2. This controller require a extra syscon device to configure the
> >    interface type, enable wake up interrupt and delay configuration
> >    if needed.
> >
> > Add Spacemit dwmac driver support on the Spacemit K3 SoC.
> >
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
> >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> >  .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 218 ++++++++++++++++++
> >  3 files changed, 231 insertions(+)
> >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
> >
> > [...]
> >
> > +
> > +/* dline register bits */
> > +#define RGMII_RX_DLINE_EN		BIT(0)
> > +#define RGMII_RX_DLINE_STEP		GENMASK(5, 4)
> > +#define RGMII_RX_DLINE_CODE		GENMASK(15, 8)
> > +#define RGMII_TX_DLINE_EN		BIT(16)
> > +#define RGMII_TX_DLINE_STEP		GENMASK(21, 20)
> > +#define RGMII_TX_DLINE_CODE		GENMASK(31, 24)
> > +
> > +#define MAX_DLINE_DELAY_CODE		0xff
> > +#define MAX_WORKED_DELAY		2800
> > +
> > +/* Note: the delay step value is at 0.1ps */
> > +static const unsigned int k3_delay_step_10x[4] = {
> > +	367, 493, 559, 685
> > +};
> > +
> > +static int spacemit_dwmac_set_delay(struct regmap *apmu,
> > +				    unsigned int dline_offset,
> > +				    unsigned int tx_code, unsigned int tx_config,
> > +				    unsigned int rx_code, unsigned int rx_config)
> > +{
> > +	unsigned int mask, val;
> > +
> > +	mask = RGMII_TX_DLINE_STEP | RGMII_TX_DLINE_CODE | RGMII_TX_DLINE_EN |
> > +	       RGMII_RX_DLINE_STEP | RGMII_RX_DLINE_CODE | RGMII_RX_DLINE_EN;
> > +	val = FIELD_PREP(RGMII_TX_DLINE_STEP, tx_config) |
> > +	      FIELD_PREP(RGMII_TX_DLINE_CODE, tx_code) | RGMII_TX_DLINE_EN |
> > +	      FIELD_PREP(RGMII_RX_DLINE_STEP, rx_config) |
> > +	      FIELD_PREP(RGMII_RX_DLINE_CODE, rx_code) | RGMII_RX_DLINE_EN;
> > +
> > +	return regmap_update_bits(apmu, dline_offset, mask, val);
> > +}
> > +
> > +static int spacemit_dwmac_detected_delay_value(unsigned int delay,
> > +					       unsigned int *config)
> > +{
> > +	unsigned int best_delay = 0;
> > +	unsigned int best_config = 0;
> > +	int best_code = 0;
> > +	int i;
> > +
> > +	if (delay == 0)
> > +		return 0;
> > +
> > +	if (delay > MAX_WORKED_DELAY)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * Note K3 require a specific factor for calculate
> > +	 * the delay, in this scenario it is 0.9. So the
> > +	 * formula is code * step / 10 * 0.9
> > +	 */
> > +	for (i = 0; i < ARRAY_SIZE(k3_delay_step_10x); i++) {
> > +		unsigned int step = k3_delay_step_10x[i];
> > +		int code = DIV_ROUND_CLOSEST(delay * 10 * 10, step * 9);
> > +		unsigned int tmp = code * step * 9 / 10 / 10;
> > +
> > +		if (abs(tmp - delay) < abs(best_delay - delay)) {
> > +			best_code = code;
> > +			best_delay = tmp;
> > +			best_config = i;
> > +		}
> > +	}
> > +
> > +	*config = best_config;
> > +
> > +	return best_code;
> 
> Is this really necessary? For K1 I just used the smallest step size.
> 
> It seems to me you have, for the smallest step size, about 36.7ps * 0.9
> = 33ps per step. Theoretically speaking that lets you fine tune the
> delay to within 1% of the 2ns total required RGMII delay (MAC + PCB +
> PHY). In practice this number shouldn't be that marginal. 
> 

I think it is reasonable, I will take you advice and use the
smallest step size.

Regards,
Inochi
