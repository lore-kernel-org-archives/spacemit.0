Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795873639;
	b=lLUmMmuXrNN2HGUAzomoEtHqC+cJo6RXzjv34n8ZejGi1lLu/CAR05UYezdK23db2vIh
	 4Mn7kSEjJtzLPwMO2c5Ku3wo+aGhmqIC64Z7VPVO+46+/8qY+56rgYIwpSEDYMQZX+3Le
	 nRkRfPvEl2Zi+BKAlwlg7TTqMcTA6Q6E6QasrhXiLfuYL+Q/+VFIEfNpETJsjiffprH7a
	 W+3DIPrXdIlz/mYAh7UKAV8kYqvBCXG4J2W7uPaTgDjwddHzllFqXV1l4AtVd5pHWxkVC
	 plE6xJ2Cw0KBi0vPrNr5QRp8BlUDBwtQrOTnRmueFgj0p2KoqxfulJeCQm/Mp4e5HeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795873639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=r0WbWTy8H8AEJBJ2yF6at8ZT6mtzoF1bxzPJALDoIu4=;
	b=eqTxPdOGO5myXjcGtl/45VRnESQGKsy8bfRWh3Z9bvWoGT3yji8uQnd9IpxKP9+9tCtD
	 GBJyL/AFmF9efw72junkY7ejeBd3z14oCMoeafrVnq9JtK4uLlqpjAmrO8Rc9zBl34mq9
	 Ull38sgrIm83MsSkH3qCJxZdUBFiP6lRGU2hZaVukSGDqE4wQgID6y3TeJfz1aiIE8Rt5
	 GliXBk6rgu3YoxrNYVf8XIQ5FfNB0Ann0/NMip9mdcJwhCUIz/mhUhdTc9fvuWd5DcNTv
	 Ex3tTVSkURsd+4KAtQK99uN77HEhYm97iEU1Mgo4gNBLiRXixp7NSHi5Yu22LKY1vAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.tenstorrent.com;
	spf=pass smtp.mailfrom=tenstorrent.com;
	dkim=pass header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=S7nwx9BT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB835606A321
	for <spacemit@lists.linux.dev>; Sat, 28 Nov 2026 13:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB835606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=S7nwx9BT
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67db1f6f50eso9214003d50.0
        for <spacemit@lists.linux.dev>; Sat, 28 Nov 2026 05:47:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795873637; cv=none;
        d=google.com; s=arc-20260327;
        b=T/AUGj7MkAH+GvOQ/VaS9hjS9UkTDB7kfmc3HbD4dGLJUbFtXdGzwUYCgKyuBvLlVd
         osw67VVAYNbaarUPvqYzDrPxLoEdSSrjoS0ixJLYHaKOuEgQU0teW7Z1wakB8n1U//i8
         lbWZ3pT56ZiWsKGFH/DTOI1b2B+D3Bm3ugcROXa6piiBKdTOqWcvaRje0CJrOLcpmlgR
         QV29xSPZANMjjfKa9rFzqUxshuSS1hpldlKSQ1CbswMiz99WDwBUhGkHh/NpslNPxiA2
         vh+fdiCT1Hc/lWiNwrAlz2Eqj9o8FGyhk81dkKfQri73DmdkxE2Qxbhbg1PGg+abwVxZ
         oLBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r0WbWTy8H8AEJBJ2yF6at8ZT6mtzoF1bxzPJALDoIu4=;
        fh=3keUQMOIjKWxictZReQ5kOB13iMv6Mp/yMPBFT6wiu8=;
        b=sBVFAOi9jwBFCW8r66mliUNyw0AOL7dib10lWyJhoNjX3Z7/PIl55JLTvA7XmwXJOo
         lcl1f5eBN1InscTAXlPtqis4FTWTmSWHCUwXwSrZfW7i2Dge8RDxthvDuEiA/DtY3AVB
         Mj7tlW6hgZp1oBmoYXm3LzWfNTj/orJOtCz2Scaysvqzfik5iHPQITle2GNgRa5XfJz3
         SdmqlOC1yXsuEVF9Z+KRQdkFYYq5Qfg4Yrb7JWCwRVwuhhx6BYQ1d9zFZP0CWC3E1ihr
         yJ0o9skix6qmpHpPXs6JPR/gT9r3wq+QM5dx2vIr8gycKr+EYWhLjdaet8NfmB0A4ti0
         r+Dg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1795873637; x=1796478437; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r0WbWTy8H8AEJBJ2yF6at8ZT6mtzoF1bxzPJALDoIu4=;
        b=S7nwx9BTLhO35r0lLMR6zgKRXYewDnMoUExTsaK+O3o5UJGB7ivbfwOecEMoQ+VqMM
         qoDSIvY3PwTElCO/3r4oLRoFKHV9+4+qQnT+UockB3gpeJJIqMrLQjZVk01IbZ63YLQG
         SoiITuNgt2NQL4yTANNHlWShjtmtx0/TnASLrHGl/+XZ01E7bpH9W6BU55L8WLzXdDJc
         sAbJ4jC+kOYJ4yXtfHy4mQjDyz02VR9nqjrvVYJSsfSX/LiUwBEJWw5s0zqc5TvXLw4G
         DEBG+12XJ3J1CkdXTi8WO6Ab3zQb27ukT0DkHattdtmwWZMbPVwpfaAdmXNKSNWZWecQ
         WdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795873637; x=1796478437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0WbWTy8H8AEJBJ2yF6at8ZT6mtzoF1bxzPJALDoIu4=;
        b=eodWYyV7coYinYyh9zFHT7WaMPnElQ/YLZzhdvPt+brAXQI6PE9gj1762ktEJNjq9L
         0maADhCg/SRYoVz+UDvpcqDATAXLvwy77JfUmcyilv8mZw+kC8Eyhl0Tp3qvJ3iw7kjK
         xzVUr8BVeuX56soqg7yIVfeA30M6Abqy1iLpZmlml8NXKlGD7jiBMIvE8hDlDM1Gua6n
         wkraWrl8IFVCJDxN3PjaUu1LXTjH8lt02JXORIP1q3WSr+mQObDPQuVEgVQDUGojK/Ur
         RUN4WweMKaXQbp7vv3fQvU+0kqGvaDlqXrqUc6qaTfI2hu02eGq2nuWdphkoPC375IU+
         SfxQ==
X-Forwarded-Encrypted: i=1; AL+hErGziGWjv06Y0YkrVFgC2A09pMF0GBRqKKKCic4p4BbJpy0D+fkCyDSsJbpqAXl1VOlz9uFMe2mNcw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9ZwlTMNMjjwIvy6MglfsJOdpM8Nc2n+9UPnSMfXZUdJgu9C3si
	lbOKqVMYuVNhbhnrlfWNu5Io2X4hCprHsdpHDgX+uEfFEycykd8AqWVr03d0tyNUP5yYb8Vkhz1
	yjEqlWoCXJGzHwq6Ma+JOMf6K9PgLzm1AQIZFawI4zQ==
X-Gm-Gg: AZFdTZdf6J3dj+OUlXFKBVXOkGpgUoc3Jkw/X5qQjvvEUjLMmQWj8wqJP2EQ/w+7dF6
	+emMHFGWHmfzSMMNyYiN3/XnzzoB2s8Vb9mpTxwQGPQaNCXhlP3j+DygVL0UZHF1RO8RjvMBYJl
	ebeRbHyjnq7YQKll2Ky82sKz+GATHjNxT7t1iWDYv8N5pyx2PIHliSd0oIcmfQql+xO02X6jUbb
	gJSLOUaTE56bmLUUeEFOKutDCRUn41C22K/8cgFBKRbJJx9x8PHOw8Y+T4uitZWF95ryPFNZaU5
	OfJX5/7y4Cgv0tQseXuOwNhM01QfLg1Fcah5RnE7CZiulbDBVtZYqmUNLYoN2vUgvhGDRCfe76R
	5236YPOehkt40XZ/JACvm5nMK7quW8VwQ0DFxZtZvHztEjTIcy221QEaO8nZBDNseLcTvomA3Xn
	ho5Wysbrh5+Kh/dqcwkwTpKhuWRg==
X-Received: by 2002:a05:690e:440d:b0:67b:9953:2d97 with SMTP id
 956f58d0204a3-67df4479b3cmr7173129d50.79.1795873636887; Sat, 28 Nov 2026
 05:47:16 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
 <20260918-k3-aclint-v3-6-cf4fd4050e14@pigmoral.tech> <yf2dawzefycxhhs7zkua3v3hoirals3wtr6rheh4li33eq7r4i@yb7cem4r6x3z>
 <DN6QXCF5LYQM.1F5IA58ETMXVM@pigmoral.tech>
In-Reply-To: <DN6QXCF5LYQM.1F5IA58ETMXVM@pigmoral.tech>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Sat, 28 Nov 2026 07:47:03 -0600
X-Gm-Features: Aa3M54r7COSuoCAZh2e-0U3S35YxbgE_qpFJlIopzh7FxBeYqA4RHXPR262VGcc
Message-ID: <CAEev2e-XsKPkEuvvdQeOuz9YymoZ_MZ8zGod+AuUUxxQPzLWPg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] riscv: dts: spacemit: k3: Replace incorrect CLINT
 node with ACLINT nodes
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>, 
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Guodong Xu <docular.xu@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>, Bo Gan <ganboing@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Junhui,

On Sat, Nov 28, 2026 at 3:45=E2=80=AFAM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> Hi Anirudh,
>
> On Fri Nov 27, 2026 at 1:27 PM CST, Anirudh Srinivasan wrote:
> > Hi Junhui,
> >
> > On Fri, Sep 18, 2026 at 12:29:38AM +0800, Junhui Liu wrote:
> >> The K3 implements separate ACLINT MSWI, MTIMER and SSWI devices. The
> >> existing CLINT node at 0xe081c000 incorrectly describes the SSWI
> >> register space in the non-secure window as a legacy CLINT.
> >>
> >> The ACLINT register space is mapped at two base addresses: a secure
> >> window at 0xf1810000 and a non-secure window at 0xe0810000. The
> >> secure window exposes all three components, while the non-secure
> >> window only exposes SSWI; the MSWI and MTIMER offsets are reserved
> >> there. Moreover, depending on the eFuse configuration, the non-secure
> >> window may be entirely inaccessible, whereas the secure window is
> >> always available.
> >>
> >> Replace the CLINT node with the three ACLINT devices, all using
> >> secure-window addresses: MSWI and MTIMER for machine-level firmware
> >> such as OpenSBI, and SSWI for supervisor software interrupts.
> >>
> >> Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3=
 SoC")
> >> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> >> ---
> >>  arch/riscv/boot/dts/spacemit/k3.dtsi | 43 +++++++++++++++++++++++++--=
---------
> >>  1 file changed, 30 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dt=
s/spacemit/k3.dtsi
> >> index c3f2dce0969c..74831974435e 100644
> >> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> >> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> >> @@ -1261,19 +1261,6 @@ saplic: interrupt-controller@e0804000 {
> >>                      riscv,num-sources =3D <512>;
> >>              };
> >>
> >> -            clint: timer@e081c000 {
> >> -                    compatible =3D "spacemit,k3-clint", "sifive,clint=
0";
> >> -                    reg =3D <0x0 0xe081c000 0x0 0x4000>;
> >> -                    interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_in=
tc 7>,
> >> -                                          <&cpu1_intc 3>, <&cpu1_intc=
 7>,
> >> -                                          <&cpu2_intc 3>, <&cpu2_intc=
 7>,
> >> -                                          <&cpu3_intc 3>, <&cpu3_intc=
 7>,
> >> -                                          <&cpu4_intc 3>, <&cpu4_intc=
 7>,
> >> -                                          <&cpu5_intc 3>, <&cpu5_intc=
 7>,
> >> -                                          <&cpu6_intc 3>, <&cpu6_intc=
 7>,
> >> -                                          <&cpu7_intc 3>, <&cpu7_intc=
 7>;
> >> -            };
> >> -
> >>              /* sec_i2c3: 0xf0614000, not available from Linux */
> >>
> >>              mimsic: interrupt-controller@f1000000 {
> >> @@ -1305,5 +1292,35 @@ maplic: interrupt-controller@f1800000 {
> >>                      riscv,num-sources =3D <512>;
> >>                      status =3D "reserved";
> >>              };
> >> +
> >> +            aclint_mswi: interrupt-controller@f1810000 {
> >> +                    compatible =3D "spacemit,k3-aclint-mswi";
> >> +                    reg =3D <0x0 0xf1810000 0x0 0x4000>;
> >> +                    interrupts-extended =3D <&cpu0_intc 3>, <&cpu1_in=
tc 3>,
> >> +                                          <&cpu2_intc 3>, <&cpu3_intc=
 3>,
> >> +                                          <&cpu4_intc 3>, <&cpu5_intc=
 3>,
> >> +                                          <&cpu6_intc 3>, <&cpu7_intc=
 3>;
> >> +            };
> >> +
> >> +            aclint_mtimer: timer@f1814000 {
> >> +                    compatible =3D "spacemit,k3-aclint-mtimer";
> >
> > I think you'll need to also include the "riscv,aclint-mtimer" compatibl=
e
> > here so that this DT can be used with upstream OpenSBI. OpenSBI doesn't
> > include the spacemit specific compatible. OpenSBI boot prints this
> > currently.
> >
> > Platform Timer Device       : --- @ 0Hz
> >
>
> Currently, "riscv,aclint-mtimer" is not part of an upstream Linux
> binding, so I don't think we should add it to the K3 DTS yet.
>
> Your colleagues at Tenstorrent proposed adding this compatible in v3
> of the Atlantis series [1], but it was dropped from v4. The v4
> changelog says that the binding will be submitted separately [2].
>
> If the binding is accepted, we can then add the generic compatible
> to the K3 DTS. Otherwise, OpenSBI will need to add support for the
> K3-specific compatible.
>
> [1] https://lore.kernel.org/linux-riscv/20261109051050.105623-5-joel@jms.=
id.au/
> [2] https://lore.kernel.org/linux-riscv/20261127061432.17306-1-joel@jms.i=
d.au/

Sorry, didn't realize that this was the reason. Lets get it added once
the fixed binding is in.

>
> Best regards,
> Junhui Liu
>
> >> +                    reg =3D <0x0 0xf1814000 0x0 0x8000>;
> >> +                    reg-names =3D "mtimecmp";
> >> +                    interrupts-extended =3D <&cpu0_intc 7>, <&cpu1_in=
tc 7>,
> >> +                                          <&cpu2_intc 7>, <&cpu3_intc=
 7>,
> >> +                                          <&cpu4_intc 7>, <&cpu5_intc=
 7>,
> >> +                                          <&cpu6_intc 7>, <&cpu7_intc=
 7>;
> >> +            };
> >
> >
> > Regards
> > Anirudh Srinivasan
>
