Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794294273;
	b=MyXNwhnKoL3IMRjoTubgYs2dhIvJI0O7tw3dGwFrLOq5o/VoBJXODaLvAxt2jXeDNl4G
	 EhCwLrYvOD3LdAFBH24+ErRapBA0CMEIEDEYgMe4C7g84FLctfYZVj5gLqKHV/jO3N0uh
	 q2xpGOc+0EUNQB0RF6cC9LezThJxcGPFYt0So2Q+ZcHRD3iQQwkectCCeTZx7yT8YGauU
	 Cy/78gd+X4R5HLz+GvUBoo9Dnpj5S7cfi/L/aVs4q7WgEqko70AgaaCymJhWMNBcHIUe3
	 ANvLSc8Fg2fmMDZDT3A2Ui+jYgftppKYIfu23L3NGU3QRwGgb2gnnInJnnjOBMsV0YA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=puumqnRyy+PGoQeNJSBFInFW8kilwjgEZfgjatHik58=;
	b=HySRwghf+pAPOXmegh//WJ9HFhkyTpAr49Qvdx8Z34TXynqDl4yI5dc2IFghgKje+i3S
	 JQqlA3rb+DakamePR1iLNlNsCfdSgpr1tzZu4SnfRFKV84i77QOVu9h8D5UAajZ9oDYSY
	 fRVOzIVkL3DQ2pqo2vLa1TRDk83EevKL8ulGZlvFhag8aO0rjNIHCQmtcBIG/gxkZSte1
	 lQKEQNIHsQT1rz8Lf8VW6uokgW2OuII6gE1qW+Img0ctsia2+o0lWp4GCkJUBkMgGqF1H
	 p9yOZgT5mp8YSbIsPBGRWhoWeJ4xfxRAgRV/3g6aBBwjzRiR+pUoKgH70uxw8Ylp/Og==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="B/B23TAz";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B7A606A325
	for <spacemit@lists.linux.dev>; Tue, 10 Nov 2026 07:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B7A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B/B23TAz
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so2752113a12.0
        for <spacemit@lists.linux.dev>; Mon, 09 Nov 2026 23:04:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794294272; cv=none;
        d=google.com; s=arc-20260327;
        b=V7p89TUtKfIjdIkY7ePTof0e++zvxwikkbeGUcfzDk255wkc55mz7FxLEh64IIC8n4
         uxoEAG8ebWEToEnsFCi5iern/7lmKhJRwJW8ugUm69DXnLntVkk41oA3XIhs462Zsca8
         uKueuEr6FwXQMSbQc7Od1JxU+1B9CKydsHpkuI8/UQvTWX5UgaRE0QJenD21e1H8T4Vl
         qaOH1kaVmY6cBcapMwMObnTlPvnXiaa7SKl8kpxWBEFKa9/UAK8vYFfSp1Xg7dpx8p5z
         3bn0yfqYfy/AE7ct6EzmY+Ft9LgTj7Pa3DiVK0cjKoIQGkUnRXsaw364lm0zmWHVeqfr
         vNRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=puumqnRyy+PGoQeNJSBFInFW8kilwjgEZfgjatHik58=;
        fh=7cg4zUftomC4CKI4Dmoc+zP7rsU7+NZ80SCJemhSU2o=;
        b=SZ9PKFaRpALZIJ+N99vtRMMwA/gRpj0Bx5LGKKCY3Z62scrAXcWrkh1ulyLkJMUxhj
         h+XVJQMUOmdKOMW4FXdxXcnp552naObsx+BwqQIjHoa9neCTaOl8GiuOYGVlfz7NvpZM
         7VwrdwLDj1mAZFqi3jfDjAUAlmAy74HWkJMrOFkVhNU8D1jruQZNF6WoTdS/jr+Zx0C4
         GAIoDA43qlHn5mwby5/FdC5ID4FSHiM9foh9nj8t9QkUBaPxSRXMwAJHSndQ1HvUvkeH
         93Ns/IHgr+pgHS/ERL/ea085bEdwrKUy5X3rz0qWf8tQTZZtuH6VJtlKroJ1Pw+Vdf4q
         AjYw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294272; x=1794899072; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=puumqnRyy+PGoQeNJSBFInFW8kilwjgEZfgjatHik58=;
        b=B/B23TAzWc7uaO0ToS1zsLnRut6ArErsErdU1K9NNuaMlMqsC1JsZSQTAEBb3tWpLh
         Ht/092dsz92no1o9EWYi3oJdC/HAA/PKyjyCDw5Yl8vhp/EUD/UdVJK79yuwUdNQNXcN
         qqpdahDJivd9Mltm+lp8WXJreqqwefkDddXDseMqyG2gmkglvCG151YBfJjwq+Ej3FP1
         odYy/gv5rKrCkK9PCrQmP+qKzvAl5Zb7eOelpe7cVjEtVogk84JwuBjxpPRaDC3W7qjr
         ECq8MvGG0gWgqkUBn9ndUWl6kC78u1KQDXSkMHsb8TtzLY5IJs95V3hXK1x/oCuP8TCV
         3wEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294272; x=1794899072;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=puumqnRyy+PGoQeNJSBFInFW8kilwjgEZfgjatHik58=;
        b=c4oUeOBN2+HSVO6MQKfHlaD9CmKoEB3JwWZ7w88Rm+2UQxLwJfE0364138sRw8X9P3
         Jx8jIRx6ISuqMBiMdoGy/irXJ4pPymsHOFP62hWlSfdUtli+EnG0DKUQ7Jtwd+bUL0Yd
         UeOqDOi5/JifobsAYUWzryyTs6x2InNsYwSaUOlaYLW71/JO0XvU2+hJDGFe2hWSlPRN
         Li3iUpkAn3RzK6nb6FCs2mbZ5LQSBoUCk2nP2l0IooXZ3Tub3B7LsQ78WU4fydiiXUzy
         ncbTSISYT1JbNfAFJCMyGu7s8KDGBrJmykYMRbqunuO+v0MUeZYk8iPpc+NMT4UjvipK
         VlzQ==
X-Forwarded-Encrypted: i=1; AL+hErGihygwpzwuhex1e19hvhQk+jWejbf72un9e+mSDkLHNHNhG6WAzlwPSVLNYSwbQNy0y14N0UYNsA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+GqqRxHUFqD/o8Y2paC/6YpTcDcSMTXvEbH2K9BnK/SgZshhQE
	ce4MsQGYYowm9bG7lsVsCnrsIv+8HFsU7G3T6pECEmfCO7nqw+IWHPCSCXnbkNFFNAyjpFv24YM
	8a6LGyCtA7wCubEkISPnJeEDM3h9Y9wA=
X-Gm-Gg: AYBFou06AP0xFrZldJ91ZACMleKvGixIYiECKTElk/F/EpAq0GVWOzMVUphPoMZYKuz
	RKMNkrENoiPG2l/vR3c66DOMnK2GjyEpG5JgIzziQ4jt8A0w9hvqF5nReOhTGXGFY4hq2aT000H
	8O+qLWEILnnKU0XUnYMVV+qnTI+IjTCK0/cjlTNwbrpmprAhBJWQu6eKKERN0R6fKfLD7z00zgb
	WDa4KVEVh9VDDtDKeuaT91T23hK9UC4rVQRppvgGMW3qD1Xau+Pu7YVSK6J3DND3DADB2jZkZtn
	uDkJovgPivWxgUUkp6DlkbCfYcA3L67gKOmfHTaqkwlGHktX5hwSLv+KcDMVQQ/xpGsiXaMMJ3s
	Riqd9BXXYhgQrgwErjT7s8eoBXTM7u+8Ew9s=
X-Received: by 2002:a05:6402:239b:b0:6b7:1b62:48f5 with SMTP id
 4fb4d7f45d1cf-6b756afdd1emr945605a12.34.1794294271512; Mon, 09 Nov 2026
 23:04:31 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110061429.2036-1-linux.amoon@gmail.com> <DMRBWY2S42EN.1CNW1DNHJOKKD@linux.spacemit.com>
In-Reply-To: <DMRBWY2S42EN.1CNW1DNHJOKKD@linux.spacemit.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 10 Nov 2026 12:34:13 +0530
X-Gm-Features: AclHuK_QdgUZlVEI88uRaFYkO0SFBxHrM1OaI5F967fviYpCpm4NPd-mBXdjZBY
Message-ID: <CANAwSgRRYCjYfuW+RqpRzbWx+_Fee2xmqr-GdtWAHCsEFZF76A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] i2c: spacemit: Avoid sleeping during bus reset in
 atomic context
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Aurelien Jarno <aurelien@aurel32.net>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, Alex Elder <elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"

Hi Troy,

On Tue, 10 Nov 2026 at 12:19, Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:
>
> On Tue Nov 10, 2026 at 6:14 AM GMT, Anand Moon wrote:
> > The spacemit_i2c_conditionally_reset_bus() function uses usleep_range()
> > to wait after triggering a bus reset request. However, this function can
> > be invoked during atomic I2C transfers (such as power-off or restart
> > handlers running in atomic notifier chains), where sleeping is illegal.
> >
> > Replace the sleep operation with the driver's internal helper,
> > spacemit_i2c_delay(), which conditionally uses udelay() when running in
> > an atomic context, avoiding "scheduling while atomic" bugs.
> >
> > Assisted-by: LLM
> Also, please drop this tag. The same applies to patch 2.
> See commit 1e035297ffda.
>
Ok once I get positive feedback on both patches, I will drop this tag
and resubmit.
> --
> Troy Mitchell
>
Thanks
-Anand
