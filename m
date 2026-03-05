Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A47839C62F
	for <spacemit@lists.linux.dev>; Thu,  5 Mar 2026 13:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772715718; cv=none; b=P6R8Y2ZnkJhUGYI3h3gfmDI1JnWX9zBZDimcPkLLa9iJwESRC9dSopZrb53xvSaS9tvbvW1F0lbl+ycC+wJO1HpuJV9H1fLsTQ3Vqp1knAffp5gIP0e7FKCvLgFP/LvLY0KNU+HGLEXuCK2bs5WI2B7W/y2vm+BTgiP09exnmPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772715718; c=relaxed/simple;
	bh=mzxuHFEBJ8rIbeR5gmZexUBLMULkEpRVqRmwwCFyU/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xfg09Y0OvzYeOl6myw/rdKrvMKlFSB49kK+vj7fxy9WidBhcKYzaUiMCo6TAyADBaf6/5zOTyN9QICgU41PC4IEPpmw6dK89PRe/eOW+ZXCo0FbODtX4O0xkehkzpJWYVe44pKmdDoi5s48ZS4UeGnmW58leK6kodFhcRLiALtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2aae146b604so60897175ad.3
        for <spacemit@lists.linux.dev>; Thu, 05 Mar 2026 05:01:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772715717; x=1773320517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IxpxVkGnClS/pzWnTPcTEx+bl+pPZR21vGpLksfVXc=;
        b=GFBU7VMY0l7D56SRY7uDubTSz+nDfv9ECLFJacB3iXc6LbZGut+SHy/7eB0cEmT/Uf
         W/IKfMKv9QSjU9i8gnKZh+jYFZ4B0q3FqEAxKe1VQbHH2RJj/SusAMXgII7TLO+Bu9Pm
         aBECX4XufRk12Gfuf1FUKA1TecZoW39i47+Z4JulRN8Un8ESuErSEJzbi1UsUiHu5b9K
         0UVb0bcI9nh9C+lLAlBvtKKFvWoG+RGL6YKlwENsMbM1ZC6N8eJa9Cx+/RhvMjkSohY5
         6N3/rBy2phMqmu6jaDoMZI0P5xd+oMihaZHNUGWso/Nz7fjUAKnjbzuYgUqI7B3fwVzZ
         S8Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVk2W80SYJPu4Bed5yRf0VDQVbnLfjBouJiA07JK9UEALGHARnndA/Q4Z4Gcm+SQrI7dPS4BMdsDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVZRGNFIekmz4wgNLdbqwQEZqlYyurhHEoP6bu4/MoqW+dPNVY
	S6nbQFIF7V/J9T/Hpsble1JliH+E6Oez141J3q5/2lHgeNeEGabwRkhm
X-Gm-Gg: ATEYQzyZsCmYEVPun7d/g48BvMBIXIuudRpLGOLJ+j67yPXkQvZTXZCKKquermK4MWg
	hYtNz5WlcWJqc1MDv/pwcObrkZpW5XYSqwqcldS0ztTkZeLA2Ai+PNDDkQWvYyZItEP8J96HW7W
	Zs6x5dy+KBv8/N6cAZFkyE7YwkWVZ6DcBQfoDp7zbZltY3m4WG+3eVC4bCz08Bw8K/hiNPt/K4g
	Hssir1/GASPYigtD5AaIgTHpn2FU6A0meFni7vkGtJ9ugD/IWaMzTQO+qDqwPLL7bpKlhH8LPFZ
	snehjrkurMqE9SXLduXVw9dFIfS3FF9Yqt6y4iylKzynMfs24KKz9PDJI20QLVeKMoX5uIS13sH
	WOuAGNApb2aZZzGquxU09taFFj9VLP8z5osn/zKdmhoTKVNacOO4uQ2KnUsvtKiQYfCH7f8ZtWy
	mU9l8+oCd1M1WrPOCsJSoF2s4M8CSmSVM+uws8PKHGubFhKIyb7tX/vJCyOpoR0zHlcT5QpIR2+
	L44qpCgaRME2BsdkJzXE7fred0BqrqMD0DzCx5vji47PqOl5vAX8PKPjHLrDA==
X-Received: by 2002:a17:902:ce03:b0:2ae:5b52:3818 with SMTP id d9443c01a7336-2ae6a9deb2amr60551085ad.8.1772715711782;
        Thu, 05 Mar 2026 05:01:51 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae54136b28sm115696425ad.73.2026.03.05.05.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:01:50 -0800 (PST)
Date: Thu, 5 Mar 2026 22:01:49 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
	Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305130149.GA1659133@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
 <20260305122957.GA1652563@rocinante>
 <20260305123956.ojkt4k3ly64xz7fu@skbuf>
 <aal6kWDx_3XRGB4K@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aal6kWDx_3XRGB4K@shell.armlinux.org.uk>

Hello,

> > > For content match, it could also be:
> > > 
> > >   K:    phy
> > > 
> > > I believe this would match everything of interest?
> > 
> > Yeah, and way more. Think USB PHY, network PHY, etc. Don't want to drown
> > the linux-phy mailing list in unrelated patches, either.
> 
> Also phylink, any memory management / DMA stuff that happens to mention
> "physical", and probably numerous other examples.

Makes sense!  Sorry for the commotion here, then. :)

	Krzysztof
