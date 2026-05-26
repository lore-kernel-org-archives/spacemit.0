Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F1A2DE709
	for <spacemit@lists.linux.dev>; Tue, 26 May 2026 09:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779787189; cv=pass; b=QPpU4uKfwxDZ/rqPqlFHbueEoGEgWp/ChYoRYeLzJW9yhWMVdAmpzk//6oE0F5N/uuX7tNNeD58nzG2HSUkUsgPj9o0tWmgrgRAKSZkx14vMCcZR37fnCeyoEqY03vIIFuH0Q5KnZEs7oHR4oU+/v1a+U8cNA4KPXpzby0hrc4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779787189; c=relaxed/simple;
	bh=nCqhwy+2ujGt6hAMaw92uzGrsq61xTHnymvFNK/1HWc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Co0IpNBJKdh/e9e1FfyOhoDVPP1hxq9NoKOqTif3pR/rGIgczMeMRzZ9ZUf9NwNi1GRGR/vNnbd/PVwGgcgJNoT6tW5K5j/03UbDb367V9PHBk8LW448o9ixWZsoT0C/c5kZyFwa8znqGzHYnV6awuIw5pSczCS/qyH4nILBhw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=MbXe9j8A; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="MbXe9j8A"
ARC-Seal: i=1; a=rsa-sha256; t=1779787168; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JIrEVqJ0TMbi0HtAi0k5V+51uQCyo2vmQ9PKNOfSQtrHNYPTeFAcAiBABel03mgbMQjwxoGoWikHE5yABgRVvfx7Ee12bPZ42+YHzsfbuu8r5bi7tROZptsKuCVlSFdMRiZKMPXFuMMp2pk3rC+XS8Pzq7n8niiYaZBpusJn3u0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779787168; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ywuraUoobG5iXyRju55nMkUCMQe8hLMWoiieILN/9+Y=; 
	b=l1lAVHamrrefVTmM0MHl6njbyTFyjb/1QunIro9rEijAosUxCVTf6l3GYIMvaEas/7cmEQmyx2mlptWfnhTSkEnoD67tjjnwPOTcCu1OMPVwkdwC5aaxTKQPIjEU7uueUjhLsEMusoVuZC03YwfZiX6tCrdNUDC+QO30bzXNZsw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779787168;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:From:From:To:To:Cc:Cc:Subject:Subject:References:In-Reply-To:Reply-To;
	bh=ywuraUoobG5iXyRju55nMkUCMQe8hLMWoiieILN/9+Y=;
	b=MbXe9j8AZm5LEtY1vZiSmrOe/H/ptnBsC4rQ08l7O0GlUi4GTvGcVOlYDEhXSoDZ
	T3tjeBb+EbTjx9NPvuJaj+EklyunZR/ihV3Hc7JKe7T9Eoz50zv1kz0iD8lkjOf4Rhv
	loa7g/XsebwtQXeZ4KSEM3NnDCCrIrjqh9euFkUM=
Received: by mx.zohomail.com with SMTPS id 1779787165669872.6342516749677;
	Tue, 26 May 2026 02:19:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 May 2026 17:19:10 +0800
Message-Id: <DISHW1IU3XJB.2WPBE8JXZUO54@pigmoral.tech>
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Yixun Lan" <dlan@kernel.org>, "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Vivian Wang"
 <wangruikang@iscas.ac.cn>, "Paolo Abeni" <pabeni@redhat.com>, "Guodong Xu"
 <guodong@riscstar.com>, "Yangyu Chen" <cyy@cyyself.name>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: k1: Split gmac_clk_ref into
 independent pinctrl groups
X-Mailer: aerc 0.21.0
References: <20260522-bpi-cm6-v1-0-707ef1917a30@pigmoral.tech>
 <20260522-bpi-cm6-v1-2-707ef1917a30@pigmoral.tech>
 <20260526044808-GKA3727415@kernel.org>
In-Reply-To: <20260526044808-GKA3727415@kernel.org>
X-ZohoMailClient: External

Hi Yixun,

On Tue May 26, 2026 at 12:48 PM CST, Yixun Lan wrote:
> Hi Junhui,
>
> On 18:01 Fri 22 May     , Junhui Liu wrote:
>> The gmac_clk_ref signal is optional for the GMAC controller and is not
>> strictly required for all hardware designs. In several already
>> upstreamed K1 boards, this signal remains unconnected or the
>> corresponding resistor is marked as NC.
>>=20
> I've not checked all exist boards which already accepted by mainline,
> but just ask, to be sure, none of them actually used clk ref pin?
> otherwise we will result with a broken GMAC/Ethernet driver..

I've checked the schematics of the already mainlined boards where the
schematics are publicly available. All of them use on-board 25 MHz
crystals for the GMAC PHYs, and the GMAC clk ref pins are either left
unconnected or routed only through NC/0R option resistors.

I could not find the schematic for the OrangePi R2S. However, the
board picture [1] shows on-board 25 MHz crystals near the Ethernet
PHY area.

To avoid changing the existing pinmux behavior unnecessarily, I think
it is safer to keep referencing the gmac*_clk_ref_cfg groups on BPI-F3,
Jupiter and MusePi Pro. On these boards, the pins are physically routed
to the PHY through NC/0R option resistors and cannot be repurposed
for other functions anyway. Keeping this configuration preserves the
previous behavior and ensures the optional hardware path remains usable
if those option resistors are populated.

For OrangePi R2S, since I could not verify the schematic, I will also
keep the clk-ref groups to preserve the previous behavior. I will only
omit the clk-ref groups on OrangePi RV2 and BPI-CM6, where the pins are
not connected to the PHY refclk path and are used for other purposes.

I will update this in v2.

[1] http://www.orangepi.org/img/r2s/details/1.png

>
>> Furthermore, the pins for gmac0_clk_ref (GPIO 45) and gmac1_clk_ref
>> (GPIO 46) may be used as GPIOs for other functions even when the
>> Ethernet controller is active. Splitting these into independent groups
>> avoids pinmux conflicts and allows boards to use the reference clock
>> signal only when it is actually needed.
>>=20
>
>> Fixes: 60775f28cfb7 ("riscv: dts: spacemit: Add Ethernet support for K1"=
)
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

--=20
Best regards,
Junhui Liu

