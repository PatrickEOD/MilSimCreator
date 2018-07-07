package mvc.entities;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import mvc.utils.enums.Privilige;
import mvc.utils.enums.WeaponType;

@Entity
@Table(name = "users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Size(min = 2, max = 40)
	@NotEmpty
	private String login;

	@Email
	@Column(unique = true, nullable = false)
	@NotEmpty
	private String email;

	@Column(nullable = false)
	@NotEmpty
	private String password;

	private String groupMember;

	@Enumerated(EnumType.STRING)
	@ElementCollection(targetClass = Privilige.class, fetch = FetchType.EAGER)
	@NotNull
	private List<Privilige> priviliges = new ArrayList<Privilige>();

	@Enumerated(EnumType.STRING)
	@Column(nullable = false)
	@NotNull
	private WeaponType primaryWeapon;

	@Enumerated(EnumType.STRING)
	private WeaponType backupWeapon;

	@Column(columnDefinition = "DATETIME", updatable = false, nullable = false)
	@NotNull
	private Timestamp created;

	@NotNull
	private boolean active;

	public User() {
		super();
	}

	public void addPrivilege(Privilige priviliges) {
		this.priviliges.add(priviliges);
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGroupMember() {
		return groupMember;
	}

	public void setGroupMember(String groupMember) {
		this.groupMember = groupMember;
	}

	public List<Privilige> getPriviliges() {
		return priviliges;
	}

	public void setPriviliges(List<Privilige> priviliges) {
		this.priviliges = priviliges;
	}

	public WeaponType getPrimaryWeapon() {
		return primaryWeapon;
	}

	public void setPrimaryWeapon(WeaponType primaryWeapon) {
		this.primaryWeapon = primaryWeapon;
	}

	public WeaponType getBackupWeapon() {
		return backupWeapon;
	}

	public void setBackupWeapon(WeaponType backupWeapon) {
		this.backupWeapon = backupWeapon;
	}

	public Timestamp getCreated() {
		return created;
	}

	public void setCreated(Timestamp created) {
		this.created = created;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

}
