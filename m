Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB433B8922
	for <spacemit@lists.linux.dev>; Mon, 13 Jul 2026 08:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783932096; cv=none; b=ConQqEI5D5F1L6IJg3oxqrjuWVBBuCKAZFKnO6TuH3yDg4vHXelEOGjo3vH3ssKg/WtBTQK/WsCJYtGafoHYbOPI3VWDClN/r3TFq2d62jTWs+KEQ9dQoQmMv7wIBDzegCIS1IypMzmrNxc3xsQ1dvPDD1pkB7+M/pqFUd2n7wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783932096; c=relaxed/simple;
	bh=NOvme/gxOhYOsUbQ8tXsECjcSWDvwomrNOupf0x3PkQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:
	 References:In-Reply-To; b=grKPJuNv8Cdx3CwJmisNbKJj/AK9UTPsQfIGLfT51bMemj9xALVD/nb+8vFt5/aXRRqtC2gOgDiPgB45gJ0HFJT2kU6sHNHEo/qDCt4mT7uQrRUZenAVCZUcucd4iWaPyCb8CCoCWPMUG/YgGbLuxJMFjYqKNp6ZT2+aeeYuYe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Q2J3cJNu; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Q2J3cJNu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1783932049;
	bh=sISlYduipxhIC/8+YFu6P/2Jp470bAA+Um+6jp0F3VM=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=Q2J3cJNuxeskSgJ4ev+Wp57H/q3qBNETBzwFBzMXbhK+eMhJXCCcNvNUfE11ERJhq
	 rtB25xb5hQ9XWnD4+gtiTbohT18JBHgHZHPLOzYT5oKtMsTW72NNyzjB4VnFuiyk7j
	 KZeLpCz0xCt+EYTyWxL48gwYWYE/DfF9Ckhl4HWk=
X-QQ-mid: zesmtpsz8t1783932042t6c01fbcf
X-QQ-Originating-IP: Ui0SBaoneSNF3lggyErwuB3eBcdpG+Je/wL+ND5KZrM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 13 Jul 2026 16:40:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 444654458287415658
EX-QQ-RecipientCnt: 9
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 01:40:39 -0700
Message-Id: <DJXB4PDMYX0G.1TC9VBR96MHMA@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Pei Xiao" <xiaopei01@kylinos.cn>, <dlan@kernel.org>,
 <rafael@kernel.org>, <troy.mitchell@linux.spacemit.com>,
 <shuwei.wu@mailbox.org>, <linux-pm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] thermal: spacemit: k1: disable hardware on driver
 remove
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <1db7d94eeaced9a92e3670d28e0c97c22f15f108.1783931396.git.xiaopei01@kylinos.cn>
In-Reply-To: <1db7d94eeaced9a92e3670d28e0c97c22f15f108.1783931396.git.xiaopei01@kylinos.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MLbAtvpy5B1Plu3KWTkfIEgoeZG1t4ROjIB6YgU8CGbGoLp3vDz4h/mf
	cF2w90JzH9VuAPYeGktztKucOaN/xoIl6VP5QFurcULcYodbXc9LVDtAxfH0Odo+JApkHud
	Q0gkLDtRUR0YXGng2Mqbg0iMkM2atOJ0JsDD5Hh+/9dOE9wUJl2PQFDPgf7ti1C9dmc1W9Y
	QhUBl5gNgFJsasxwCaNgOh9Yn2mwn6C5AY0po/DAJ+pMxVJsHCnaam9qSmqO6eMj3QbWa2s
	ZWC/NUQ4kt/p4MqMTK/aiU+5278ey0SwnN+K9eKR8tveZim9kaymJstJjUV8TNCF7FgSdKp
	4BQKWTZa70FsZ5OYtKj3fqfETosCC6zL2U1OD3tl+OK1anh9LvVLdsr+WdoRBL3LCh0kwsk
	ST2MLjA+G9nneKSh9BM8wULy+f6/yesM/KWXKLJnSi4ElICtv9n9xX4wIdy90p+p1gygB2e
	1FjzDxSS7quI/LJuwtpe4U31VxwA5BI8Krp3f7UmN9Y0eQ9tU4QCh8tdnkj4VXf1c9904JS
	OeYJDBnT1t2SEYz3HtCRXhj074hm3SnJKFtYqNTTy/dAphX6RHGGhtD++360YcBUQtkGH5c
	aC9NUMqbz18Cim3Yb8Jvlf5ARuuh/4dy/CCWLrIZ1GgN/EHv3d20qDU6dilPA1kL54U4jyC
	oY4Ejwj02TPUNwXz4IlhqjzI28uXK26/TNy+UXEcptAGfyq78kaytNZz6iSlVCZRrUEOAp/
	8vns698ErXTXcOFz7l+FftJdSGRlz4ZhZXPdEYnRO2hKDZGpwXzVb+cptTFOQ5wC3a/q69M
	t7a7iMc4V9dFtpVZO6M41Z9EjhZTcp5CyR99Ok8Wdl4P+jRnZmS9v87Q9Ep9IGTMnaSNvol
	AgyIHTzUuTkgNv3ARO0zxZWLuLBDHzV3wH0D/TL4Yol8AeRu6xCefjfzqUyVgzufUisyK3R
	6ZtNQpNd6eBexOx7ebmMXwDuZU4xt1In45IcCMU81KGR3MmmH8BMPvqTB3xeOJ6Gmd6BRtN
	jgtZLjBuX368AJRFwPpQ9SMS/R1d0K9dNMHIqHaxsmsna2g1a6
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

On Mon Jul 13, 2026 at 1:32 AM PDT, Pei Xiao wrote:
> The driver uses devm_request_threaded_irq() but never disables the
> hardware interrupt enable, sensor enable, or sensor power bits when
> the driver is unbound.
>
> Add a devm action that clears K1_TSENSOR_INT_EN_REG,
> K1_TSENSOR_EN_ALL, and K1_TSENSOR_PCTRL_ENABLE on remove, mirroring
> what k1_tsensor_init() sets up.
>
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  drivers/thermal/spacemit/k1_tsensor.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/thermal/spacemit/k1_tsensor.c b/drivers/thermal/spac=
emit/k1_tsensor.c
> index 79222d233129..cf79dc7d403f 100644
> --- a/drivers/thermal/spacemit/k1_tsensor.c
> +++ b/drivers/thermal/spacemit/k1_tsensor.c
> @@ -199,6 +199,29 @@ static irqreturn_t k1_tsensor_irq_thread(int irq, vo=
id *data)
>  	return IRQ_HANDLED;
>  }
> =20
> +static void k1_tsensor_shutdown(struct k1_tsensor *ts)
> +{
> +	u32 val;
> +
> +	/* Disable all interrupts */
> +	writel(0xffffffff, ts->base + K1_TSENSOR_INT_EN_REG);
> +
> +	/* Disable all sensor */
> +	val =3D readl(ts->base + K1_TSENSOR_EN_REG);
> +	val &=3D ~K1_TSENSOR_EN_ALL;
> +	writel(val, ts->base + K1_TSENSOR_EN_REG);
> +
> +	/* Power down the sensor module */
> +	val =3D readl(ts->base + K1_TSENSOR_PCTRL_REG);
> +	val &=3D ~K1_TSENSOR_PCTRL_ENABLE;
Why is only the ENABLE bit cleared here?
At init time the driver also sets:
    val |=3D K1_TSENSOR_PCTRL_RAW_SEL |
    K1_TSENSOR_PCTRL_TEMP_MODE |
    K1_TSENSOR_PCTRL_HW_AUTO_MODE |
    K1_TSENSOR_PCTRL_ENABLE;

Should the other bits be cleared in shutdown as well, or is clearing ENABLE
alone?

                            - Troy
