Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5865919EED3
	for <spacemit@lists.linux.dev>; Tue, 10 Feb 2026 05:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770702650; cv=none; b=EuAU3lFANVBoVGtbnfzF1J1qQUh+IZ2vN0rTTCLI4m9RDY3107RXGxViKOvk7WtxkG3hNj7bl5z4PeD75hNOviZluCqEIt82yGO9GgsnpRSdw7tPiyLOIbTKAODKWyLCI73ScLIpvxDoPOGPJG9Hw5nWtNv/Oef8DU4dJ4xsP8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770702650; c=relaxed/simple;
	bh=JFqUNAJPbfntakYgXlVmPUWBmjS6ZT274Op0DauQgpg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=TXMdQhBNcEvoeGn5+EzXaSoU3U8Yig2e0Gv0mqBvjQimg6YwfCxVjjBaYI/zyXyVO3joZ/T8SLhxxOQay3af5aR7BNRcFTw8QO7IwXhF2hOvZYvDC4rRKkBniLos3InChQTrm8rJAZ2mI9+lMFcnCRNoIPyh2Kw1/E4mIGqR2pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xKmyqxOK; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xKmyqxOK"
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770702646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JFqUNAJPbfntakYgXlVmPUWBmjS6ZT274Op0DauQgpg=;
	b=xKmyqxOKd8/xaTlxkb/W4z+DNBVpe10MC+GteYSStR81VuLNbYcB6DflytOpkoJuxjQ2Xs
	hFJylvG0GlZX+PsWuqAFBimHqkTKy4nDG2A4ekGUXZwZM8x2CM6bK61Dq9rQOgHuUQvk6v
	LaWj+8VwT1xRY8X7PeIl3xiSEy19iOs=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 13:50:32 +0800
Message-Id: <DGB1P3K6I14J.1QCMDY84ZR7ZH@linux.dev>
Cc: <broonie@kernel.org>, <conor+dt@kernel.org>,
 <devicetree@vger.kernel.org>, <dlan@kernel.org>, <huang.ze@linux.dev>,
 <krzk+dt@kernel.org>, <lgirdwood@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <neil.armstrong@linaro.org>,
 <robh@kernel.org>, <spacemit@lists.linux.dev>, <vkoul@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: spacemit: add regulator support
 to K1 USB2 PHY
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <huang.ze@linux.dev>
To: "Chukun Pan" <amadeus@jmu.edu.cn>, <krzk@kernel.org>
References: <8c3835c4-3602-4cee-9631-0551b0341918@kernel.org>
 <20260209064016.1176056-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260209064016.1176056-1-amadeus@jmu.edu.cn>
X-Migadu-Flow: FLOW_OUT

On Mon Feb 9, 2026 at 2:40 PM CST, Chukun Pan wrote:
> Hi,
>
>> Plus, if this was a vbus regulator it would not be called "phy"...
>> Even more confusing.
>
> Sorry, I didn't consider that this naming is confusing. Other
> platforms, such as Rockchip's inno-usb2phy driver, use the
> "phy-supply" property. I continued with this bad naming.
>
>> Bindings are supposed to be complete regardless what driver does
>> (or does not).
>>
>> You must list all supplies with proper names.
>>
>> If this regulator was missing, then what else?
>
> (...)
>
>> Please start describing in the bindings your complete hardware, not
>> your drivers.
>
> It appears Ze Huang described the vbus-supply property in
> spacemit.k1-dwc3.yaml.
>

> So I should enable the regulator in the dwc3-generic-plat driver.

No, we will enable regulator at port level.

>
> Sorry for the noise.
>
> Thanks,
> Chukun

