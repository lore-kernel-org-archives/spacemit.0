Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793764170;
	b=C5UZP41XLMGJe4neA95SQIJACPVIO7SIFObWlBn85iZgzWreyO2If93qu+MvPD6yxJjM
	 r+26bnY1D0xA5QfH+YrR26VTGo2hqPvgXZ6gaZeZeZI27girOTnVWHPHSfWLSyLBxXAUi
	 IFqrOoSdFEKbYczrnoj5AldTTWM0KDsLT2viL338OSXkn65c2ggLzI0yfBI03UzrcnFOZ
	 1vIY9ssVOBHx/9+YAdJCDxCs+mCByQDtgNxXFnxVrZ/mg6q4L151cyc0KrmF721ZOxr4T
	 YAVynDVFq1/vj4TLJmg73mH0JBbJq+loU8YRSYv8+3iFRmavB5TNWgScXP6Cb1upI4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793764170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=9kk3sRi1aculBZU66F60BKhOUZviUp1oqsdUxzqAQDU=;
	b=TWGdkYSQ0DDxMTRBYZuuitR8322QBqyr2d5M/ipmkRe+sIgErI6tz9gCy1GDNwpbYYZE
	 tGIgyBMeItJv4KlWetJr4jBKLLWkDLAkjnGPpll3siG8gLxXX0CGzBoe3tt1UvHygs52D
	 3FJ4fMi3vq3O9ukTJA5+pDrqiiTrz0/K4CK4Fcje4llnrYqTxwstk3r9suYm/9xcv3tKi
	 aCLJxe5Neu+jX/DZoF3UaI28Y5HDUIuiaBvl6EJAJANyYfrbN982yQWs0cRFhqT8Jasom
	 BjtBl4/edQhziOkxZtfwkbq0bJxpGvOQoG+f0OLvMsh8nAlDu/GxmMX/Pk8kUEUt4Bw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Id8lfuZJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5E9606A31B
	for <spacemit@lists.linux.dev>; Wed,  4 Nov 2026 03:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C5E9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Id8lfuZJ
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b125371596so12327127b3.0
        for <spacemit@lists.linux.dev>; Tue, 03 Nov 2026 19:49:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793764169; cv=none;
        d=google.com; s=arc-20260327;
        b=fwXkjzcsk47Dypsk4k2zulpFeo8XO2g2k/RHeLLMnjcM9G05QyhG0MGe1TF8+BuSJn
         Qwp8/2XbV4rYSq65P5nNKV/8vfks1uEDYrFoosRaIjm5cblVZZ3D4xocR2n49eZmxg5r
         m9i3cpWDMj00Hig6xQWL0Gp/+YUkkZO+4hS93CW8d30ykt7k1ZY0X/7um8YOJCntbeAb
         lM5bO6GFegshPqbo7TZ4D6F5YztVr8It1ORJvVBDAoQiUEUl4sgKTDl2Rj9EBYZMOJNz
         P7SgwOF/GwlaE1LqtmbreKL++2RfFRABpwlrRYolqIvp/VxakUajiTjUz2k4W8RGe8C+
         XAcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=9kk3sRi1aculBZU66F60BKhOUZviUp1oqsdUxzqAQDU=;
        fh=d1ziWItS7Z8p9CF0nBAmNxX0FriFWFE/cjBUyAJa1KM=;
        b=H2JKJr7jE7rn/P3wpqIxtFs1iBZgaKeq0HcycfyVEQdB3hKD8UqQ+7squPnR9cdTkt
         j+y4UiL+TrVV7hD7ynr0weLtkaCalYFhwQtMw5pP4aXvcbQ0/LaG1oEC/Y0uG2D/7Hrt
         bh2iGl9r+mTTpIXQwompKI7M1I5vCrxBn8hdnN0qZJutWYWrMeip9nEQiZScwCV11ZcT
         fXD+GS9ZhZxTSn+VQzrKXMkBWsiy+dvshIpP7i7p9o4AtXEeABVIlBpvzK+Covts9T7f
         1yve3qmorZ/3fVmxGQEGD/xzEjmkzhXkAlMHKmR6sDwRt/1eXF7A+hBBO9CMC/6euBYn
         A7/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793764169; x=1794368969; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9kk3sRi1aculBZU66F60BKhOUZviUp1oqsdUxzqAQDU=;
        b=Id8lfuZJ1XYQde8VhwTbpnOc52YEQNdazoM2IZO5D+RBKnOgm62Jvg0GfPfW+q8dbh
         Acu7b7FHJPMVrPnNjOlDQW69BiqzRIyvP2uLrMxGemXVqIqYHiBJT5leHnIWe2mGOgui
         fbXYcETHhl6gqqTBc1mhONyMtIc+NREpmU8uP8vXHejdNcNblSNJviZbaIgV+SxIAZa2
         +tf5jjvCmhmePGbzwydyuzHJTkCJtov5/dNvXbGyeUmie3Jmj9upLu6Ij3YWSWoJgc24
         mwrUH9SH6trrnKWYANKicaEZBnvx9Mnq/eTRI1glZnnsYbUPY45n6OUg0RfI9FiXsNnd
         1CGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793764169; x=1794368969;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9kk3sRi1aculBZU66F60BKhOUZviUp1oqsdUxzqAQDU=;
        b=LdXYguU+BiuNyRuumL1MbgZJysEingb95D3Z8HmPDM6y5ew4OBJZT7gAd/0EnGxiSy
         eK6RalQyf9CzdjixcWhP15FtEeF71reNuYwQpPPnXnIRUfZWZ5OOPvxvTnNmcEgPWvOO
         LGSZ1wRTm0eFwOYv0gVYJlouc8ZBAETA4H1kRftJ7AvEl3DUh8KsRUkS8b0Kx+It4NNZ
         VMHBBtnup75OxHp2bjptEpvLeuQEZzzZKKRz7FkIRb+Bn4S5yxlEGFY2EfNh62YcGaOM
         i6nfD0VQBHUkOhPtXqoyItIY1dlolTpyzM+ebwe1ioTaHs8zleqkP6zmyod24U1PyNbJ
         gL9g==
X-Forwarded-Encrypted: i=1; AKwUvBwYH2rCuKz0ezTokXn9Tx1JewqROMiATC+RE0JT5DbbSPCqKev1rogxCy+ILaQjNuOYmkoL50U5IA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/ImewxDmQuemY81z84gja0ARdj6cceMkrrGqM2gy/y78mxpFfI
	TG8Ws+eRD4xtOrs0AeFOJ5oZHf0aDrJ1v4DxvfWSHFuexwUClFjOm6QNVPPI/UOiQJ3uskGR3OR
	E47g5iAD54sDQ3jf3FKMwK4qpLejFAmQ=
X-Gm-Gg: AYBFou0NccvQsVP0dnb5/Ti9NGY0zx1v//nh4xf1XyxEuof+GxafaYjgITU7dfy5J6I
	7qAHr1bdha8NMkrIWxynVnaLOSUsaXLti6Wf6S0c6c/0PBCLqljKGK/voBPeMwgTd42EU3rKLBv
	JUtx3HYVpI2+OcnP7w49x2JYDTJvINexrQ8FCn+8oB0KTLqhzi7FRF6d4Ri3J1GIN/8fG9Ycb5H
	nNmr6niBmdAdqWPjKMGzLIvyIe6nxpdSmfQk0VMdnoml/69oLvchJXvHkAFWuRpRtY2RxMziaKQ
	K2xgdn7liGqL9r2+83Lsuf8TuPcK1gPd9fKPJCrXJvWN8I2KUh0/UGo/8dQDuaOgV/xOPw9bgSk
	DAPF0vpJX4esuHuffocr21+q99nADyFLig1Mflw==
X-Received: by 2002:a05:690c:f90:b0:8ab:3b98:5a30 with SMTP id
 00721157ae682-8b1c68babdfmr128642167b3.33.1793764168725; Tue, 03 Nov 2026
 19:49:28 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Marc Taylor <marctaylor700@gmail.com>
Date: Tue, 3 Nov 2026 20:48:52 -0700
X-Gm-Features: AclHuK_kx1iiAU8XRRGnC7TaKzisocPDFXhmTTmqtetI1Obl0uzsvk2UQA3gpMg
Message-ID: <CAKNLDZPXzah6h_rj3YmZtf+WvAbFRNVxr2XGnRnuUpfMH-PB0A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] reset: add support the GPIO provider with #gpio-cells=3
To: bigunclemax@gmail.com
Cc: p.zabel@pengutronix.de, brgl@kernel.org, krzk@kernel.org, 
	linusw@kernel.org, andre.przywara@arm.com, martin.botka@somainline.org, 
	dlan@kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: multipart/mixed; boundary="00000000000016b0ca065f6b4451"

--00000000000016b0ca065f6b4451
Content-Type: text/plain; charset="UTF-8"

Hi Maksim,

(Re: <20260423230338.442497-2-bigunclemax@gmail.com>. I'm not
subscribed, so this may not thread; sorry. Adding linux-sunxi.)

I hit the same bug on an Allwinner H700 board (Anbernic RG35XX Plus,
sun50i-h700-anbernic-rg35xx-plus.dts: RTL8821CS SDIO Wi-Fi behind
mmc-pwrseq-simple with reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>) on
v7.2.15, and the code is unchanged in v7.4-rc1. With CONFIG_RESET_GPIO
enabled (arm64 defconfig has it =m):

pwrseq_simple pwrseq: error -ENOENT: reset control not ready
pwrseq_simple pwrseq: probe with driver pwrseq_simple failed with error -2

mmc@4021000 never probes, so there is no wlan0. With RESET_GPIO
disabled, pwrseq_simple falls back to plain GPIOs and Wi-Fi works.

Two notes on the RFC:

1. It no longer applies after the reset-gpio rework that landed in
v7.1/v7.2 (fwnode_reference_args, __reset_add_reset_gpio_device()
taking a fwnode, fwnode_reset_n_cells).

2. I think the 3-cell software node reference resolves to the wrong
line. gpiolib-swnode reads the reference with nargs = 2 and uses
args[0] as the chip offset and args[1] as the flags. With
<bank pin flags> stored in the swnode, PG18 would come out as
offset 6 (PA6) with flags 18. If the CB1 works with it, I suspect
the real reset line is simply left deasserted. (Code reading only;
I didn't run the RFC itself, since it doesn't apply here.)

Attached (and below) is a port to v7.2.15 that asks the provider's
of_xlate() for the chip offset, so the swnode stays <offset flags>, and
skips the reset-cells check for the GPIO fallback (reset-gpio says its
cell count "is not really used"). On the RG35XX Plus with
CONFIG_RESET_GPIO=y:

sunxi-mmc 4021000.mmc: allocated mmc-pwrseq
mmc2: new high speed SDIO card at address 0001
rtw88_8821cs mmc2:0001:1: Firmware version 24.11.0, H2C version 12

/sys/bus/auxiliary/devices/reset.gpio.0 exists, debugfs shows gpio-210
(PG18 = 6 * 32 + 18) requested as "reset", out hi ACTIVE LOW, and Wi-Fi
associates and gets a DHCP lease.

This isn't a formal submission. I'm happy to test a v2 of yours, or to
turn this into a proper patch if that's preferred. Philipp's earlier
suggestion (pwrseq_simple falling back to devm_gpiod_get_array() on
-ENOENT) would also fix this board.

For the approach below, on Anbernic RG35XX Plus (H700):
Tested-by: Marc Taylor <marctaylor700@gmail.com>

--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -1019,12 +1019,13 @@
int ret, prop = 0;

/*
- * Currently only #gpio-cells=2 is supported with the meaning of:
- * args[0]: GPIO number
- * args[1]: GPIO flags
- * TODO: Handle other cases.
+ * Supported specifiers:
+ * #gpio-cells = 2: <offset flags>
+ * #gpio-cells = 3: provider-specific (e.g. Allwinner <bank pin flags>),
+ * translated to a chip offset by the chip's of_xlate
+ * The flags are always the last cell.
*/
- if (args->nargs != 2)
+ if (args->nargs != 2 && args->nargs != 3)
return -ENOENT;

/*
@@ -1034,8 +1035,7 @@
*/
lockdep_assert_not_held(&reset_list_mutex);

- offset = args->args[0];
- flags = args->args[1];
+ flags = args->args[args->nargs - 1];

/*
* Later we map GPIO flags between OF and Linux, however not all
@@ -1046,8 +1046,7 @@
* flags.
*/
if (flags > GPIO_ACTIVE_LOW) {
- pr_err("reset-gpio code does not support GPIO flags %u for GPIO %u\n",
- flags, offset);
+ pr_err("reset-gpio code does not support GPIO flags %u\n", flags);
return -EINVAL;
}

@@ -1055,6 +1054,33 @@
gpio_device_find_by_fwnode(args->fwnode);
if (!gdev)
return -EPROBE_DEFER;
+
+ if (args->nargs == 2) {
+ offset = args->args[0];
+ } else {
+ /*
+ * The software node built below is resolved by gpiolib-swnode,
+ * which only understands <offset flags>. Let the provider turn
+ * its own multi-cell specifier into a chip offset.
+ */
+ struct gpio_chip *gc = gpio_device_get_chip(gdev);
+ struct of_phandle_args spec = { };
+ u32 of_flags;
+ int i;
+
+ if (!gc || !gc->of_xlate || !is_of_node(args->fwnode))
+ return -ENOENT;
+
+ https://www.google.com/url?q=http://spec.np&source=gmail&ust=1793850302384000&sa=E
= to_of_node(args->fwnode);
+ spec.args_count = args->nargs;
+ for (i = 0; i < args->nargs; i++)
+ spec.args[i] = args->args[i];
+
+ ret = gc->of_xlate(gc, &spec, &of_flags);
+ if (ret < 0)
+ return ret;
+ offset = ret;
+ }

guard(mutex)(&reset_gpio_lookup_mutex);

@@ -1193,7 +1219,11 @@
goto out_put;
}

- if (WARN_ON(args.nargs != rcdev->fwnode_reset_n_cells)) {
+ /*
+ * For the reset-gpio fallback args is the GPIO specifier, whose cell
+ * count is the GPIO provider's, not the reset controller's.
+ */
+ if (!gpio_fallback && WARN_ON(args.nargs != rcdev->fwnode_reset_n_cells)) {
rstc = ERR_PTR(-EINVAL);
goto out_put;
}

Thanks,
Marc Taylor

--00000000000016b0ca065f6b4451
Content-Type: text/x-patch; charset="US-ASCII"; name="reset-gpio-3cell-v7.2.15.patch"
Content-Disposition: attachment; filename="reset-gpio-3cell-v7.2.15.patch"
Content-Transfer-Encoding: base64
Content-ID: <>
X-Attachment-Id: 

LS0tIGEvZHJpdmVycy9yZXNldC9jb3JlLmMKKysrIGIvZHJpdmVycy9yZXNldC9jb3JlLmMKQEAg
LTEwMTksMTIgKzEwMTksMTMgQEAKIAlpbnQgcmV0LCBwcm9wID0gMDsKIAogCS8qCi0JICogQ3Vy
cmVudGx5IG9ubHkgI2dwaW8tY2VsbHM9MiBpcyBzdXBwb3J0ZWQgd2l0aCB0aGUgbWVhbmluZyBv
ZjoKLQkgKiBhcmdzWzBdOiBHUElPIG51bWJlcgotCSAqIGFyZ3NbMV06IEdQSU8gZmxhZ3MKLQkg
KiBUT0RPOiBIYW5kbGUgb3RoZXIgY2FzZXMuCisJICogU3VwcG9ydGVkIHNwZWNpZmllcnM6CisJ
ICogICAjZ3Bpby1jZWxscyA9IDI6IDxvZmZzZXQgZmxhZ3M+CisJICogICAjZ3Bpby1jZWxscyA9
IDM6IHByb3ZpZGVyLXNwZWNpZmljIChlLmcuIEFsbHdpbm5lciA8YmFuayBwaW4gZmxhZ3M+KSwK
KwkgKiAgICAgICAgICAgICAgICAgICAgdHJhbnNsYXRlZCB0byBhIGNoaXAgb2Zmc2V0IGJ5IHRo
ZSBjaGlwJ3Mgb2ZfeGxhdGUKKwkgKiBUaGUgZmxhZ3MgYXJlIGFsd2F5cyB0aGUgbGFzdCBjZWxs
LgogCSAqLwotCWlmIChhcmdzLT5uYXJncyAhPSAyKQorCWlmIChhcmdzLT5uYXJncyAhPSAyICYm
IGFyZ3MtPm5hcmdzICE9IDMpCiAJCXJldHVybiAtRU5PRU5UOwogCiAJLyoKQEAgLTEwMzQsOCAr
MTAzNSw3IEBACiAJICovCiAJbG9ja2RlcF9hc3NlcnRfbm90X2hlbGQoJnJlc2V0X2xpc3RfbXV0
ZXgpOwogCi0Jb2Zmc2V0ID0gYXJncy0+YXJnc1swXTsKLQlmbGFncyA9IGFyZ3MtPmFyZ3NbMV07
CisJZmxhZ3MgPSBhcmdzLT5hcmdzW2FyZ3MtPm5hcmdzIC0gMV07CiAKIAkvKgogCSAqIExhdGVy
IHdlIG1hcCBHUElPIGZsYWdzIGJldHdlZW4gT0YgYW5kIExpbnV4LCBob3dldmVyIG5vdCBhbGwK
QEAgLTEwNDYsOCArMTA0Niw3IEBACiAJICogZmxhZ3MuCiAJICovCiAJaWYgKGZsYWdzID4gR1BJ
T19BQ1RJVkVfTE9XKSB7Ci0JCXByX2VycigicmVzZXQtZ3BpbyBjb2RlIGRvZXMgbm90IHN1cHBv
cnQgR1BJTyBmbGFncyAldSBmb3IgR1BJTyAldVxuIiwKLQkJICAgICAgIGZsYWdzLCBvZmZzZXQp
OworCQlwcl9lcnIoInJlc2V0LWdwaW8gY29kZSBkb2VzIG5vdCBzdXBwb3J0IEdQSU8gZmxhZ3Mg
JXVcbiIsIGZsYWdzKTsKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCkBAIC0xMDU1LDYgKzEwNTQs
MzMgQEAKIAkJCWdwaW9fZGV2aWNlX2ZpbmRfYnlfZndub2RlKGFyZ3MtPmZ3bm9kZSk7CiAJaWYg
KCFnZGV2KQogCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsKKworCWlmIChhcmdzLT5uYXJncyA9PSAy
KSB7CisJCW9mZnNldCA9IGFyZ3MtPmFyZ3NbMF07CisJfSBlbHNlIHsKKwkJLyoKKwkJICogVGhl
IHNvZnR3YXJlIG5vZGUgYnVpbHQgYmVsb3cgaXMgcmVzb2x2ZWQgYnkgZ3Bpb2xpYi1zd25vZGUs
CisJCSAqIHdoaWNoIG9ubHkgdW5kZXJzdGFuZHMgPG9mZnNldCBmbGFncz4uIExldCB0aGUgcHJv
dmlkZXIgdHVybgorCQkgKiBpdHMgb3duIG11bHRpLWNlbGwgc3BlY2lmaWVyIGludG8gYSBjaGlw
IG9mZnNldC4KKwkJICovCisJCXN0cnVjdCBncGlvX2NoaXAgKmdjID0gZ3Bpb19kZXZpY2VfZ2V0
X2NoaXAoZ2Rldik7CisJCXN0cnVjdCBvZl9waGFuZGxlX2FyZ3Mgc3BlYyA9IHsgfTsKKwkJdTMy
IG9mX2ZsYWdzOworCQlpbnQgaTsKKworCQlpZiAoIWdjIHx8ICFnYy0+b2ZfeGxhdGUgfHwgIWlz
X29mX25vZGUoYXJncy0+Zndub2RlKSkKKwkJCXJldHVybiAtRU5PRU5UOworCisJCXNwZWMubnAg
PSB0b19vZl9ub2RlKGFyZ3MtPmZ3bm9kZSk7CisJCXNwZWMuYXJnc19jb3VudCA9IGFyZ3MtPm5h
cmdzOworCQlmb3IgKGkgPSAwOyBpIDwgYXJncy0+bmFyZ3M7IGkrKykKKwkJCXNwZWMuYXJnc1tp
XSA9IGFyZ3MtPmFyZ3NbaV07CisKKwkJcmV0ID0gZ2MtPm9mX3hsYXRlKGdjLCAmc3BlYywgJm9m
X2ZsYWdzKTsKKwkJaWYgKHJldCA8IDApCisJCQlyZXR1cm4gcmV0OworCQlvZmZzZXQgPSByZXQ7
CisJfQogCiAJZ3VhcmQobXV0ZXgpKCZyZXNldF9ncGlvX2xvb2t1cF9tdXRleCk7CiAKQEAgLTEx
OTMsNyArMTIxOSwxMSBAQAogCQlnb3RvIG91dF9wdXQ7CiAJfQogCi0JaWYgKFdBUk5fT04oYXJn
cy5uYXJncyAhPSByY2Rldi0+Zndub2RlX3Jlc2V0X25fY2VsbHMpKSB7CisJLyoKKwkgKiBGb3Ig
dGhlIHJlc2V0LWdwaW8gZmFsbGJhY2sgYXJncyBpcyB0aGUgR1BJTyBzcGVjaWZpZXIsIHdob3Nl
IGNlbGwKKwkgKiBjb3VudCBpcyB0aGUgR1BJTyBwcm92aWRlcidzLCBub3QgdGhlIHJlc2V0IGNv
bnRyb2xsZXIncy4KKwkgKi8KKwlpZiAoIWdwaW9fZmFsbGJhY2sgJiYgV0FSTl9PTihhcmdzLm5h
cmdzICE9IHJjZGV2LT5md25vZGVfcmVzZXRfbl9jZWxscykpIHsKIAkJcnN0YyA9IEVSUl9QVFIo
LUVJTlZBTCk7CiAJCWdvdG8gb3V0X3B1dDsKIAl9Cg==
--00000000000016b0ca065f6b4451--
