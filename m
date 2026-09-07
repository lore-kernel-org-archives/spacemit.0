Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A8518B0F
	for <spacemit@lists.linux.dev>; Mon,  7 Sep 2026 02:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788748508; cv=none; b=d4s4EpeOoMquV1pmC66A4agL1SNM1VG70LuQkgnWMacXHvslck4v9Q6Fdy609hVvyAnBA6Jd/nIljpln4huYd/6xzPzxq3rvZ+F0kA7SfAByvuHt/uo6PM2IclP3NGBESfEiw1Y9bFcn3orLv/IWOlPo6rOdGiOghEt9Wm4+Vp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788748508; c=relaxed/simple;
	bh=/n3xihmU93G11KDPuXpxUGjTF/aZtrqDlguEa+obsXQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=C3G1Dcknk/qTRrCyUJqH+h7vevYPAkX4Tj/9dsbXtLoD8YURYlzmOcY3FOqXnUAc9pZRE+MeicEJPpWhFwiWAoWBA9z6cM5L3jYqcGY/9JHQuK3ASpFUlA2p4uPHFxbTqaWYEIqTgfh8lc+Vhii7xPJBwUjU4fYfAJWQEpFeiME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=kPpcBlqQ; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="kPpcBlqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788748493;
	bh=/n3xihmU93G11KDPuXpxUGjTF/aZtrqDlguEa+obsXQ=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=kPpcBlqQEvSQBLI78Elo7gnb72DI8U8o36Fu/XYO7mpZHO+3awF+8TvtUj89a4ct/
	 YWAvRlyhjEAnlLhC9Z9Wk8oST5FPFoRByvZc7e+cgSyRAkmEB/eWb5J/OQeK7DrAbv
	 j5M8k6zCQdCD+Hkh8++lzkcSbdQ0W/7xBr3vPstU=
X-QQ-mid: zesmtpgz3t1788748484t9bf26c94
X-QQ-Originating-IP: 7jcO50RqRIZxPHY/moH8hgYnotivvrpyVTcywJ9C5gY=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Sep 2026 10:34:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9707735077275929228
EX-QQ-RecipientCnt: 59
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=c3446b7a882d909a1fb5e6c3d06e6abafc7af191330f8ccc8edf46454865;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 07 Sep 2026 10:34:37 +0800
Message-Id: <DL8QEYABXVMN.2CF6XXBXZ1X6U@linux.spacemit.com>
Cc: <linux-can@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-omap@vger.kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH net-next 25/33] net: spacemit: k1_emac: Remove comma
 after sentinel-entry in match-table
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Siddharth Vadapalli" <s-vadapalli@ti.com>,
 <dario.binacchi@amarulasolutions.com>, <mkl@pengutronix.de>,
 <mailhol@kernel.org>, <msp@baylibre.com>, <florian.fainelli@broadcom.com>,
 <jonas.gorski@gmail.com>, <andrew@lunn.ch>, <olteanv@gmail.com>,
 <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <kurt@linutronix.de>, <hauke@hauke-m.de>,
 <chester.a.unal@arinc9.com>, <daniel@makrotopia.org>,
 <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
 <ansuelsmth@gmail.com>, <linusw@kernel.org>, <luizluca@gmail.com>,
 <alvin.sipraga@analog.com>, <clement.leger@bootlin.com>,
 <justin.chen@broadcom.com>, <dlan@kernel.org>, <rogerq@kernel.org>,
 <hkallweit1@gmail.com>, <linux@armlinux.org.uk>, <rjui@broadcom.com>,
 <sbranden@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
 <opendmb@gmail.com>, <andrei.botila@oss.nxp.com>,
 <wangruikang@iscas.ac.cn>, <amadeus@jmu.edu.cn>, <kees@kernel.org>,
 <tmshlvck@gmail.com>, <c-vankar@ti.com>, <horms@kernel.org>,
 <vadim.fedorenko@linux.dev>, <daniel.zahka@gmail.com>,
 <nora.schiffer@ew.tq-group.com>, <v-singh1@ti.com>, <oss@vassilevski.com>,
 <haokexin@gmail.com>, <alex@sverdlin.org>, <aleksandr.loktionov@intel.com>,
 <lgs201920130244@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260904043724.2955444-1-s-vadapalli@ti.com>
 <20260904043724.2955444-26-s-vadapalli@ti.com>
In-Reply-To: <20260904043724.2955444-26-s-vadapalli@ti.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NRqh+gkd4iF1LDIR2L2imYhWmWmFPB1GA/kqC1K9WP6WB0JweNFE8ZVe
	PjFrkvdFDQWYWe6EYNuqRqI3NpsZb1/+htkMowxmO18fAAx7UkvlZ19G7nZzRKhbujsLuI0
	DXZhmPxggTMZLsM+nOK+cQY5mBgVDIZLhjOPm2AwQirY/LwWS227dF+MHC3nPQMowmnFC5h
	VN7L5XBhUtoCEWAd5mvP8VAyzTuTScGa+0XWUU15awi3n/DsiotNP+/RJkOVEpXtWU5bD/K
	7RrYx6Xp9DWhpUNQB4XbybB7G0wI1NlJity6fs0ZtGnVgsIqFtezXj9Acdraq0q6L1QY3Vw
	7ANvuy5sDDCxe93na1bSUUuDpJHL8W4Zc2T1FgLeb0lMSeu/GuFndHNPhBlL46JBtpOy8qL
	jyY3sECJc0SbzN4jP/C+NtL2xU2TtMV04xWiO42EQVqJjgYKoixgfvSNd8vvINin53ABcFj
	WG/FtEaIHh/r20HkI6Mr0sLZIRP6GAW+4quGMEagnIUlwjVIneZws9KKirNXBsBk7rMOhKs
	61JpaY3m/nurY5YurnVMsmhL0pM32vHoic8mg5itPnCRkEGaKybTbzDzceGlEFPSPrQH9pa
	9b6baN3Skypt3vURpCqfdImYBxBEW3V1G8G2qU+AgQTAul1ponfgzd28+e2F+fIbhTgMV8j
	9vCEZZjrjZMLeyH8OFcHUV35eu5Tb6I6bio8c6EYSe5C0JTYjy5OCV+QlYTnGKGfzv5rmcd
	zQHBpW798E/H2CfRRojcGZLlwU8Tq0FSljoA1kPO04EZh0Yxj/BTG7xxU3aVOX/QGhEeDIR
	24Kkl6zmGmgSe5WdrEOvrDpA8GUs6cBWhlf0DU43cNv4AxWoi9T1npnZORKgRZFp5Rczn4U
	deIZ0eJyHn6WBpXJEoG3h/SjFYWN66cpw+Fla0sSsveh8KEIr4LBRe/rFYNAE6/NtT/aq7+
	4CO0mUHRNSDF3KllL0zsI0Dp/YpG9viYWhrkh0RH7CQcslMwYAB86+NOZVY//XDp1XnXi0+
	rMxR8FkCAhoKP6CbFqC2UipwRAtNZ8iNB0AVyPXsrzM2oOI+htkDrNYUI8b5j0DlMLqddlo
	jFmjI+Uee1/
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

--c3446b7a882d909a1fb5e6c3d06e6abafc7af191330f8ccc8edf46454865
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 4, 2026 at 12:36 PM +08, Siddharth Vadapalli wrote:
> Since sentinel is the last entry and we do not expect further entries
> following it, remove the comma.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

--=20
Troy Mitchell


--c3446b7a882d909a1fb5e6c3d06e6abafc7af191330f8ccc8edf46454865
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCap4ivQ0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvrKoA/jq66no0m3AM6WPip5A8SiOQeVPyie/PjbmRqO4w
PamfAQCtuus+o1dOGS/PPW44oBGtqifxJT5WcMspAw/AJH0KCQ==
=xCA3
-----END PGP SIGNATURE-----

--c3446b7a882d909a1fb5e6c3d06e6abafc7af191330f8ccc8edf46454865--
