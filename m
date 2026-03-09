Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A90638F242
	for <spacemit@lists.linux.dev>; Mon,  9 Mar 2026 22:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773095207; cv=none; b=Ugmlf8INh96cZI3ZOC1ndTj+Xl1s2kA1POOtaiJODo8v0zYCUcIvLc0EWOJxt//iEVIs3yC17IgW4gtDCZTA/1wccQtuwzaT8yazL7VnHSoYgpORoOexxc5ystUwQjXgKRrY485DcHE4aQ3R45eoGW6X2PYu9DjE2oWpG2QjomY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773095207; c=relaxed/simple;
	bh=i0GRJfSHh/D61KwItNe6fb7adZHJMaGkMix9ht+i3A0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Re1OlPiSMdvQtdj4U727PWtjmng2i6Dowl7fHjVbUJRFOUcHQ2qKXDITk5cXP5xRVXZJ+Jyd7j0vI5M8rpZzz9JNORlnK0I7SZIBjD6a+bvAsWIkRNobhp5DwgVFaqkFRJ1OX/xwIkPqr1cosQN3OtnmdBiGJ+yayKdEv84Wj7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nd2CGhJF; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nd2CGhJF"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cbb6d5f780so1228267985a.1
        for <spacemit@lists.linux.dev>; Mon, 09 Mar 2026 15:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773095205; x=1773700005; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b0qmAnC6DnZWfkO5AOHdxhn/T13J7DQN3esTSP9cxW4=;
        b=Nd2CGhJFjWMOQDbrFudIuy3+AcoyQbb+0vjMeGyhzYPLaeOr/t4OQG6ZlSGx+Q0i5+
         k9eyL/D8mfET06L6O+Y/AEJow4Pe7GS735vy/wLua4ealD40uCK+uuHa+IpGb1S6FZSq
         ksSSId7HU6Itln8Bhc2vgv5BR1pi2n83cRaxYv7G800BKSfz7vBfnT+5U8dGvNtByPPw
         SpvbwqnUCjGyHMsAavuGJNvpm6Hqm/16sdSmC4LTubMIm5GhbP7cd+xDoULlXeiZn+gG
         7yUC/AYMba390nQqdmtsu+w7kIF60Qw3gEN58DCIgWDHQafTb0DqS8sdZq9gMFILnKD+
         SdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773095205; x=1773700005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0qmAnC6DnZWfkO5AOHdxhn/T13J7DQN3esTSP9cxW4=;
        b=TU/WbLYhxUz6JRHB+ii6VuMcIdi1hGcHekqQVSROWtnhaiWDfz7c/GAdepwU8wywxs
         WZb33NXkKkVv/cEF4twEI6Xj96OkQJCLXBOHFe1HWgYTDuxKqcRkMwPuAs5iaj9ZAOWL
         9pClUoMkQqpcY9Y+A863mRi9IplScH/BZqcZTIWB/yKebFhIN5OuoL3N70XhsCxVrXlc
         Fqc9iu2ptQdK090ZNkf9ZwJJa9aZTI1ENrmTYS7GBHn62Zobim09zNfQnQUHA/m1V6sx
         WfsIVeQ5VXyHspYbkgVnX+fwZoAMPbuQhoIjlaSgb9Bt8oerxaBNA4IGIhiDDwWMtbdq
         0Vow==
X-Forwarded-Encrypted: i=1; AJvYcCViaZKtcRjnCN43/9ITOoRBTnx7kWq4jMM28di8AFRQqs8PgSLTzxu44XaZZV0ocRjs1ETPhSf0eA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7D9uVbOsww5lQUcfuNsnc+O883bIZfCYJdwZ334ihCzQa1IPx
	poLSHVmX4fETQNpLDTYM5azHqgt0ufmj+rlRAo+y6JrZuEE440ZlzBew
X-Gm-Gg: ATEYQzztCT/DHGvk6ww1m60wFm5fRP1b7IStCNivRGU780JYkWNTjz8aTVvwLe3T1LT
	HMJdLbnrujKPaAisCB2B8xxbpwtvb9HJGKbpSMd2Av2gW+09kzLx+/vPo3WIqnjB77/esv1fpAQ
	h+JPsOvtoUi+MmK9x4asZhHRS/SpIZkTsP8xWDyXJ1GPBZvWZm+Q5lqkaGOcpsRJeThnxzQh3gk
	TD6IZAMCgVfHl+7TbhNrkK5tC8LGKm0djC8Vf4vNv95GQ+hceSGgwnHK4GTiTBqYDt1FzFcsK8y
	225V0f1EFSK1VIwQ7R/jvHBNIO3pyWiqg6TuLaNlXsXvUE9tS8kGOvQWFRepmHSJppPtKFwisG8
	ApJCunzYwI8iY7ask0ddZ8iv4zLNer5hqz6EUvjDY2Pc5GNd5YQhn35yMZyOWgSYZEc00IXQ92f
	0PaUXh9RWCGadOHz51lFUkaZT7HTBlMEWQxA==
X-Received: by 2002:a05:620a:c55:b0:8cb:4289:6c1a with SMTP id af79cd13be357-8cd6d549b1fmr1572894885a.75.1773095205343;
        Mon, 09 Mar 2026 15:26:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd866f7074sm325445485a.6.2026.03.09.15.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 15:26:44 -0700 (PDT)
Date: Tue, 10 Mar 2026 06:26:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v8 3/3] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <aa9I4pIZs5-TDdXo@inochi.infowork>
References: <20260309004305.315018-1-inochiama@gmail.com>
 <20260309004305.315018-4-inochiama@gmail.com>
 <aa62FTHMOJGhVKTv@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa62FTHMOJGhVKTv@shell.armlinux.org.uk>

On Mon, Mar 09, 2026 at 11:59:17AM +0000, Russell King (Oracle) wrote:
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
> >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> >  .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 227 ++++++++++++++++++
> 
> One last point, please add another patch which adds a MAINTAINERS entry
> for this file, so you can be Cc'd with future stmmac developments.
> 
> Thanks.
> 

OK, I will add a MAINTAINERS entry for both this file and
binding file.

Regards,
Inochi
