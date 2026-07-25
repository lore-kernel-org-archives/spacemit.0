Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D769F2836F
	for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 14:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784991063; cv=pass; b=cKIACRu2VryzTEX7bvW4DylEoeYuH0aZ5TwVysrPe29fYdxYwl8EX0WrNtWa/mrJlDM7J7GfpsQ+/r0l6q+fIXF6eV0C03wgTFyb4JZZQqE4iQtdlrk8LbeAB0Go3MygQv/QYY35pcx6HIaRzdOt8H7HNan3a3AOpxbm6BQ58uM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784991063; c=relaxed/simple;
	bh=szwjKwTuz+yNKvdBSprSzOYxNaUpFRKs+Hx1+fytJsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GIzexH3pFW+d2n7iUCJ6tV4hcpnJ0X+Ya1AZA1Yw3somxG/IQyyUTsD2em+YHKjBACE+1IULc9rq8nBl02vOVumnEOtayfH9n6d2+WkdCuTi6ttoNKArLlB7OUJcWfzjaRIcb5Ot5QT0ehIay/JL8oBlIT+uoVEq5QkwKgXFWi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=R44papgH; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="R44papgH"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-667f1390f58so1285923d50.1
        for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 07:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784991061; cv=none;
        d=google.com; s=arc-20260327;
        b=ASRjnzn+xAOn/s0qOBBRX2QNXinZzkYX7jexCIgdl4uDXXc4QdyBnbe6tCIbUA0OX4
         Sro05jpsp2ERMOPlwcKf17CMZ3xM7jFXBfpAPe35M4UDO9FpFlAXjmwrBxeXMMkL2gZz
         itN6xDFTaw/eWeC6cKDkdg8dW/oR3JncT5udeTEstPfDFkK6+Lc1BTqq3rNXO5VoLTxA
         01WNLXUtwpIcXa1hCt+WymiaNkFetqLyMr4gsF5TUjWKH6EY3Ur6v41M7PPlgwY66kGI
         gSRbTngtQrMNp5fE6aroG+ekUfP5XEeItFKtEekdW42uJP+wstomXrOR3r+aHhrnnx7w
         jiNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pnFY+NL1wMs6HQctnpLrg5MSHuL5XLJldyr4+uKR9zM=;
        fh=wW25Qk0hFR7mzh/hLC5sm51FEXzgE4eZ01pGACvYkWs=;
        b=Cpl3/xk5WIEi3yZInq/vYFwO20Utl5NKgQ+/570tlVpa4NJkkwLIDcW+0eCdvgex/a
         AWOObkL1pYa1SrFjlkV9t/AhZLgnFYvGlkKmZ8qXCbe7VUe8u9pYYji7fzo8NQMGvn/l
         GY1CtOEr0lRzlcGZ/eolukI/Z7D7dQkwbRsJBlIO/SXoaMG2QPA/U+mML34+vT99tnzW
         X5a5RzxB1HlWuKG8cnHQuP+BiIo4o8MtezR+VeY5PAmSA4VXlo4+WvDO2JMGrSYWeWdu
         vUDN8cuz1PI/Dwzmtu1mBYG0emt5sdG5YQZk44mbtMW6+QZmH/hc2Ovi5BOR3TjWlrsb
         bxkg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784991061; x=1785595861; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pnFY+NL1wMs6HQctnpLrg5MSHuL5XLJldyr4+uKR9zM=;
        b=R44papgHwtXIuBnUcQz11ylX0AG3InhpsGeJDFlMl2kykeMRAkhmvwxGWMnY5w9mly
         rE6wcjU+OaZh6mfVZA4PtkkrQKIrVG5TgWwCuUuVkpgTPGbLdhl6h+5rvY9NhK4l95dS
         z4YSgOEQT0JxrbMge9M4aZ8W7NBnZQOSnbZMBVpY2OcKVr50fGzY3NqQxt0ZAJthUyBI
         Op2GUUZB/W+V6Mxr7qRnxs+a3OnCD5NQjPxX0f5yiLxT9JRCzsXRIUpLvJPuQgZKB8sv
         eOfKIFIKIgpaH6AwltrJn8QiRWLEzwDcFsM3vyISjVKXwPEPL9GJeMfp5Flm3M4Nk9rJ
         3DGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784991061; x=1785595861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pnFY+NL1wMs6HQctnpLrg5MSHuL5XLJldyr4+uKR9zM=;
        b=NgKw8QSJk5FVa1Nu6bbo1vw5T3Z7gQ1p+i9uSAzUvx2qYfBpTjSO+96b2OtCyszJ1L
         Nl7vPqI88U5BbN1k9fsWZIhjuvwXKYKowtu7WSVTmwwc5wKVjk7qp9IEWt0dIEstA8aF
         fZyD1C/AHLMArRkZQCZWZfBa4KxfOYaN8+dL/QZcfY73k0nC//owX+wRCPwBRDRdBuFG
         UXz/HpjFsElieXJOQetwn/nlh2f7fTcXZD/VE9gf991qdEMB7keCLfhERKq/SBkamV69
         nJX9H7e+mzzqHzCkUvrFagEMl6IS5jqYsMWdP9J4hTZN+I+wkV00OBa6q6+MmLx4v83f
         0dLQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRVcX1AkPHOYJeyBSHp/+KqCNkAxL7/fRQA1MATOVS7bWovHDlFSs/7dKZkV4fwx0FzosOfeEEmw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxH4dh7+LPchfTYkzxhr896TJy04d94F5kbS9a4Bk3tuco9bIQr
	D8WjC/EyupkSQr27K1nvaVViQ3COFnU5YWY7Lxoz4Mr/vvntbHVqVooAgOOdVlB5Pl+tsgFj77h
	o7Ga3+3/3vAXvy+VFZoJWYuqOkAL/TGQkI5Pi8U88nw==
X-Gm-Gg: AR+sD13OfhQOI6L2J/PKctkoZiK5yv7kGze1xZwsIjUI73wRP9VM3cJXLsg7XBGXT/U
	C36Kxa+9JpQrBOBSNeWo6c3m1/5Fo3RY5bpcQXGa7BUjGgKQAKnbYRBoGEwex5mvk8grze73Tek
	At5tkBWAqPbdOv02wjagA9tjjPemmxId5Yr5pYwnRsyCxo2c2nlv2UNggO9NBAYhYWKmodg0Xub
	m9tS591+Ww6B+r1GSH2OCSFn8CKZrCEPCa6jf9tQeMsqFngG5HMvvygtUnQynzClDBkUHPRnRQ4
	CwkoZpzIRKV6R1wMi2w2kSrs/ehBlVpl9WplSWa/foYeBmiWW9c=
X-Received: by 2002:a53:acd0:0:10b0:668:98b:dc54 with SMTP id
 956f58d0204a3-668c7a3fc07mr491029d50.41.1784991060853; Sat, 25 Jul 2026
 07:51:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <20260702-08-k3-ufs-support-v1-2-1a64a3ab128f@kernel.org> <7x3b4sttnc4oxkuvxmpkihfi76lkapjcigo7khgcgfytvol7w2@v5ykuyrk2z3m>
 <20260725091824-GKA77545@kernel.org>
In-Reply-To: <20260725091824-GKA77545@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Sat, 25 Jul 2026 09:50:50 -0500
X-Gm-Features: AUfX_mxi8h9KJVu9G6xUZkOpr4TATQAXRS0gOluTWc4FpB0HNeql-4Yjcvl9SVk
Message-ID: <CAEev2e8z3cJn+ALoqu=ZoozpTJ6vO_eTgiDrSjC4nOC1XK57FA@mail.gmail.com>
Subject: Re: [PATCH 2/3] scsi: ufs: spacemit: k3: Add UFS Host Controller driver
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

On Sat, Jul 25, 2026 at 4:18=E2=80=AFAM Yixun Lan <dlan@kernel.org> wrote:
>
> Hi Anirudh,
>
> On 15:16 Sun 12 Jul     , Anirudh Srinivasan wrote:
> > On Thu, Jul 02, 2026 at 02:31:36AM +0000, Yixun Lan wrote:
> > > SpacemiT K3 SoC consist of UFS (Universal Flash Storage) Host Control=
ler
> > > which has features compatible with JEDEC UFS 2.2, MIPI UniPro v1.61 a=
nd
> > > M-PHY v3.0 standard.
> > >
> > > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > > ---
> > >  drivers/ufs/host/Kconfig        |  12 +
> > >  drivers/ufs/host/Makefile       |   1 +
> > >  drivers/ufs/host/ufs-spacemit.c | 931 ++++++++++++++++++++++++++++++=
++++++++++
> > >  drivers/ufs/host/ufs-spacemit.h |  90 ++++
> > >  4 files changed, 1034 insertions(+)
> > >
> > > diff --git a/drivers/ufs/host/Kconfig b/drivers/ufs/host/Kconfig
> > > index ff170c0b6da0..4f53b7f7688f 100644
> > > --- a/drivers/ufs/host/Kconfig
> > > +++ b/drivers/ufs/host/Kconfig
> > > @@ -132,6 +132,18 @@ config SCSI_UFS_VARIABLE_SG_ENTRY_SIZE
> > >     bool
> > >     default y if SCSI_UFS_EXYNOS && SCSI_UFS_CRYPTO
> > >
> > > +config SCSI_UFS_SPACEMIT
> > > +   tristate "SpacemiT UFS controller driver"
> > > +   depends on SCSI_UFSHCD_PLATFORM && ARCH_SPACEMIT
> >
> > Can you add SCSI_UFSHCD_PLATFORM and SCSI_UFS_SPACEMIT as modules to
> > riscv defconfig (or just add the former and add a default y if
> > ARCH_SPACEMIT in this Kconfig entry). This will let defconfig kernels
> > to boot with persistant rootfs on these devices.
> >
> Ok, will consider adding one entry to riscv defconfig, but this should be
> handled in another separate patch, for making it as module or built-in dr=
iver,
> I'm incline to choose latter one, but would be glad to hear different opi=
nion

Module sounds good.

> --
> Yixun Lan (dlan)
