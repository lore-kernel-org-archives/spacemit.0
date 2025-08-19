Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E743426D4EF
	for <spacemit@lists.linux.dev>; Tue, 19 Aug 2025 09:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596807; cv=none; b=DUrc4LTnj+66ehy3blbYM8smJ+YKqpyHLx7bbOmYTgx/2ACHQ0l5CewzUyjHUUg4xSAC1wX6kYuk2aLSytkKffs3q2y1OaTAcceGUbqbdDEr7j5mpydJvl20+EpcOQ57h/qLfkg/kHVP2kfTd9HLrx5c+si7KF7h2Or0Lbi8dYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596807; c=relaxed/simple;
	bh=CnJekPM0wQKG9e7pS0aBHZul0jrDqWHtRHfFM2JeVrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t51xBGCmVMT25SLgUptIpZ5ywaksR0640xlM35hAHQPHIPTqyKK30R2rREkgrdrN1Rpa0atjtcNsPXqBnXUtyR7NSnEK2uYwBK5Apopj6sEENiIz0l8PD+DDitm39w+6F10RgrQzdkwpABQPMKBQ2Irw+xuT6VNeVA1k7wo+xrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JLPewtHF; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JLPewtHF"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55ce509127bso3967188e87.0
        for <spacemit@lists.linux.dev>; Tue, 19 Aug 2025 02:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596803; x=1756201603; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnJekPM0wQKG9e7pS0aBHZul0jrDqWHtRHfFM2JeVrQ=;
        b=JLPewtHFp/2vKTYvkMUsWFnP+9zYbxjrtYID6W39gZylKdrfrliaeZqNR8sUPrxoxP
         1oaMKsmqGbtSEaFUm5T515SuLx5ff5dS+ZueypuYWPWUYqFCeDgvFp9YBtTkOp1dKfc2
         M5WEIg53FCamcHSmnnUegR8ehVwFXOlhxaWO6qVEG1/zdTEjqmqDW4cQZJI/ON96wmdd
         fmnzE9TpeOQM7CgjkECprqdZk+39rueh7G6kpXLZv37vu00lzsFBREsYEwgTQnDSh5CI
         aAHCd5vHgQqYn/+/OZ2z+PVgF66uHQpV6Qx54ODjx1OBhsNnL9VHCFiy/SyTTkcQc+i0
         8VtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596803; x=1756201603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CnJekPM0wQKG9e7pS0aBHZul0jrDqWHtRHfFM2JeVrQ=;
        b=se0vFVDGC1AYFF/TlAFwcdwvIvVyydjDJpWA7/ycOM32TZmCO9zsbQSTzN8Qc8o89F
         TVot0C+KI0YYi9f/O4xAvk9KfJRBPA35bachuEqGmLB+pZXY0dKjlI6v9cFDWI5Wmq/O
         y9kOEMawi0Ll0eA1go5hnmGUeAxqaVuPbz7GTVDhYO5+V8iAD1KICwYK2Nx/75IaleD9
         ePZ8fjRESNJwjEKmjj0IVG1xfjwqYzXQUWSUTFaVkFpeb86y/YkpupuGKegQumAjqdzW
         kgGzFJ5ama8O4lP7lQGr7BPGeCqD6SWHmfaPXTL0kqti1OYB18iRc/Y6PJceDA2tH9F9
         wKOg==
X-Forwarded-Encrypted: i=1; AJvYcCUptpASjb0M1ezJigv51hU3qyIA5QFP/59+XXE5y+V6JZ1W6xUpivDICMUwe6QygOjsl98Bgd/aDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywkln2xC8yDi53QH8rzYdJ5EXHCdRPbmsY/qqcKeneUWQry5oWn
	KKVcoOTtJuaDsoGC1x5qwB7bOO7T4GfF9mLO2A8aO91LpRx0mCCoj600wusrj2AP3+IntA2bqmv
	8hh8RKLQAByBqwr9sVJVPhsyOKUimizSpuwW8hnuKuA==
X-Gm-Gg: ASbGncvUvrN0RWo5KeC7l7AlDHjkpszErC6XmlU2++huWv3vKWRjpZlqx+eQVchbaEP
	knv3gZMFp8Hmm8w3ERpZK8HeZxDk4cf5QqlEHIGeAw9059rNVgyaM7WwXDxdu6VltzzcEEiVGyE
	mj1mRaoUwzdLYqdCQ1rjafGPhs3HiYsDqx/HQlDJ7fQ2NEU2OrgBlBhXdKYz5I5bJc1+uCz0ha1
	AmatSg=
X-Google-Smtp-Source: AGHT+IEnhi69VygT7g84GFEWBMGYd/u/z/IkVXlUwHEo4DfM7Y7k8WnKy5jP9SBDHCTX2vCUgNODYTsIltctm9ywUhA=
X-Received: by 2002:a05:6512:61d4:20b0:55c:c9d5:d337 with SMTP id
 2adb3069b0e04-55e007aecbfmr398443e87.24.1755596802917; Tue, 19 Aug 2025
 02:46:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-16-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-16-b3bf97b038dc@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 11:46:31 +0200
X-Gm-Features: Ac12FXzd6X-i_It645W5rQicFyi-TYZe6vnFChkDKrkqPz2wrPccuV5zYO_EO9M
Message-ID: <CACRpkdaeF5VueC44jQZzdJjVJXj2F7cDsOzb6aa6bHLgQJXS7Q@mail.gmail.com>
Subject: Re: [PATCH 016/114] clk: gemini: convert from round_rate() to determine_rate()
To: bmasney@redhat.com
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Cercueil <paul@crapouillou.net>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Michal Simek <michal.simek@amd.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Andrea della Porta <andrea.porta@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>, 
	Viresh Kumar <vireshk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Alex Helms <alexander.helms.jy@renesas.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
	linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 5:18=E2=80=AFPM Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:

> From: Brian Masney <bmasney@redhat.com>
>
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
