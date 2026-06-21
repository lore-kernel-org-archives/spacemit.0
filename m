Received: from hall.aurel32.net (hall.aurel32.net [195.154.119.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F4728C84A;
	Sun, 21 Jun 2026 13:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.154.119.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782047702; cv=none; b=KsMOYqPb8wpsl8nGAZkvy/+WMjHm6xMlAw5/ntVLJRhACM8L0cT9yij3ZkGwG8gCRMUA3RnnM6FsclcR1JUUV/9nGUvK7oR51S3HtaR3Tabru9ESoyhn5l48RsE/tMygjvRqO/Jje6F1dDh4Ic2HTDMYlj81GJzn3kZ2EV2QObI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782047702; c=relaxed/simple;
	bh=Ggyqf4V9QdplCClTk9Hgs7Wmob2TRbKYdHkBOyzeNPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qsl2MeppW46ATYDUh2iN9Rz8qsKLl7wfioG9LXhIGqZ8dgxhtbWN+9IHRwd2FPZFogkf8IRpOgqCf4/94keDd5Yi18ZmvdKdPmOxyVBkJ6vtPjBFEUodwPwZx4OpkIEdOit5YpDBQRJlpVZpXKzRTDlISeKx72tdS50XAmyvEb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net; spf=pass smtp.mailfrom=aurel32.net; dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b=YNyrsNRJ; arc=none smtp.client-ip=195.154.119.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aurel32.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aurel32.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="YNyrsNRJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=b+7H29dkhVMGO3TYR7p0AjHCtsPqiNAR3VmqxDlgg4k=; b=YNyrsNRJGh7cNXixVSGLbXkyEk
	T2/vIARUjYirxMyH2xW4s2iHF1+SyuVXCAhsx17kSaGPIt9VCEuhS7RZHOLUoqMPRRG/APRk6ZMJi
	sz7ka3/uEhDz1YzflamAKg4DTOUVCnMYeFdxW8PjHiMRzxxm3miJFfNJL0WFLUtt2WLkioGyj7liw
	BH8K8gporiEqUMXxArI8SON95X2V7JP66KqR6so/4uxrR99r3WPeX+hqwZlrLI+vZRA2Ryvvy+yW0
	3ZoeEK0h0NrIALxny7BBN8wSUdQFvSfTm4+Y+67MVh8BapQ8XdARoRG1yAGXvGTM3SeE745RLoQ7i
	KCQQOSLg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wbI0h-00000001gBd-1xzv;
	Sun, 21 Jun 2026 15:14:51 +0200
Date: Sun, 21 Jun 2026 15:14:50 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 2/5] riscv: dts: spacemit: enable the i2c2 adapter on K3
 Pico-ITX board
Message-ID: <ajfjyvSCVBVgr-UO@aurel32.net>
Mail-Followup-To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260620062238.3199108-1-aurelien@aurel32.net>
 <20260620062238.3199108-3-aurelien@aurel32.net>
 <20260620062948.0A1161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260620062948.0A1161F000E9@smtp.kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)

Both issues reported by Sashiko AI (see below) are valid, I'll submit a=20
v2 fixing them, but I'll first leave a few more days for humans to also=20
have a look at the patches.

Regards
Aurelien

On 2026-06-20 06:29, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Low] The pinctrl subnode is named `i2c2-0-pins` but belongs to the `i2=
c2-1-cfg` parent node.
> - [Low] Missing space before the assignment operator in `bias-pull-up=3D =
<0>;`.
> --
>=20
> commit 4dc6c92d42831e85b38f3350c15707d0e2b3af18
> Author: Aurelien Jarno <aurelien@aurel32.net>
>=20
> riscv: dts: spacemit: enable the i2c2 adapter on K3 Pico-ITX board
>=20
> This commit defines the I2C2 pinctrl properties and enables the adapter
> on the K3 Pico-ITX board. It will be used by the 24c02 eeprom.
>=20
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/=
boot/dts/spacemit/k3-pinctrl.dtsi
> > index 23899d3f308a0..c9fe9c2e5aeee 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
>=20
> [ ... ]
>=20
> > @@ -45,6 +45,17 @@ gmac0-phy-0-pins {
> >  		};
> >  	};
> > =20
> > +	/omit-if-no-ref/
> > +	i2c2_1_cfg: i2c2-1-cfg {
> > +		i2c2-0-pins {
>=20
> [Severity: Low]
> This isn't a bug, but should this subnode be named i2c2-1-pins to match
> the i2c2-1-cfg parent node? It seems to diverge from the standard naming
> pattern where the suffix of the parent and child matches.
>=20
> > +			pinmux =3D <K3_PADCONF(46, 5)>,	/* i2c2 scl */
> > +				 <K3_PADCONF(47, 5)>;	/* i2c2 sda */
> > +
> > +			bias-pull-up=3D <0>;
>=20
> [Severity: Low]
> This isn't a bug, but there is a missing space before the equals sign
> here, which diverges from the spacing used in the surrounding code.
>=20
> > +			drive-strength =3D <25>;
> > +		};
> > +	};
>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260620062238.31=
99108-1-aurelien@aurel32.net?part=3D2
>=20

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net
